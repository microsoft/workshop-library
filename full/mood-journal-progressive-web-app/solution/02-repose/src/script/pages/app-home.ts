import { LitElement, css, html } from 'lit';
import { property, customElement, state } from 'lit/decorators.js';
import localforage from 'localforage';
import { JournalEntry } from '../interfaces/journalEntry';
import { dbName, getLast7Days, seedLocalStorage } from '../utils/journal';

// For more info on the @pwabuilder/pwainstall component click here https://github.com/pwa-builder/pwa-install
// import '@pwabuilder/pwainstall';

@customElement('app-home')
export class AppHome extends LitElement {

  // For more information on using properties and state in lit
  // check out this link https://lit.dev/docs/components/properties/
  @property() message = 'Welcome!';
  @property() journalDB: any;
  @property() last7Days = getLast7Days();
  @state() private last7DaysJournal!: any;

  static get styles() {
    return css`
      .hero {
        height: 90vh;
        min-height: 600px;
        max-height: 900px;
        max-width: 100%;
        max-width: 100vw;
        padding: 0 48px;
        overflow-x: hidden;
        position: relative;
      }

      .hero__inner {
        display: flex;
        flex-direction: column;
        position: relative;
        max-width: 800px;
        margin-left: auto;
        margin-right: auto;
      }

      .hero__top-content {
        flex: 1 1 0px;
        color: white;
        margin: 4rem 5rem 0;
        text-align: center;
        max-height: 25vh;
      }

      .hero__top-content h1 {
        font-weight: normal;
        font-size: 48px;
      }

      .hero__top-content fluent-anchor {
        margin-top: 1rem;
      }

      .hero__top-content fluent-anchor::part(control) {
        border-radius: 15px;
        color: #107652;
      }

      .hero__top-content fluent-anchor::part(control):hover {
        color: #2E765E;
      }

      .hero__top-content .entries {
        display: flex;
        flex-direction: column;
        margin-top: 2rem;
        max-height: 50vh;
        overflow: scroll;
      }

      .hero__top-content .entries fluent-accordion-item.main-accordion {
        height: fit-content;
        -webkit-backdrop-filter: blur(20px);
        background: none;
        backdrop-filter: blur(20px);
        background-color: rgba(255,255,255,.3);
      }

      .hero__top-content .entries fluent-accordion-item.main-accordion::part(heading) {
        font-size: 1rem;
        font-weight: 200;
      }

      .hero__top-content .entries fluent-accordion-item.main-accordion fluent-accordion-item.child-accordion {
        background-color: rgb(216, 167, 177, 0.3);
      }

      .hero__top-content .entries fluent-accordion-item::part(region) {
        background: inherit;
      }

      .hero__top-content .entries fluent-accordion-item::part(icon) {
        border-radius: 50%;
      }

      .hero__top-content .entries fluent-accordion-item .panel .panel__body {
        text-align: left;
      }

      .hero__bottom-content {
        flex: 1 1 0px;
        height: 50vh;
      }

      .hero__bottom-content img {
        width: 100%;
        height: 100%;
      }

      @media screen and (max-width: 840px) and (min-width: 625px) {
        .hero__top-content {
          margin: 4rem 2rem 0px;
        }
      }

      @media screen and (max-width: 625px) and (min-width: 480px) {
        .hero__top-content {
          margin: 2rem 2rem 0px;
        }

        .hero__bottom-content {
          margin-top: 7rem;
        }
      }

      @media screen and (max-width: 480px) {
        header {
          margin: 0 2rem;
        }

        .hero {
          padding: 0 1rem;
        }

        .hero__top-content {
          margin: 1rem 0;
        }

        .hero__top-content h1 {
          font-size: 36px;
        }

        .hero__bottom-content {
          margin-top: 7rem;
        }
      }
    `;
  }

  constructor() {
    super();

    this.journalDB = localforage.createInstance({name: dbName});
  }

  async firstUpdated() {
    // seed local storage with sample entries
    if (await this.journalDB.getItem(this.last7Days[0]) === null) {
      seedLocalStorage(this.journalDB);
    }

    const last7DaysJournal = await this.getLast7DaysJournal();
    if (last7DaysJournal && last7DaysJournal.length > 0) {
      this.last7DaysJournal = last7DaysJournal;
    }

    console.log(this.last7DaysJournal);
  }

  private async getLast7DaysJournal() {
    try {
      let collection = [];
      for (let i=0; i < this.last7Days.length; i++) {
        collection.push(await this.journalDB.getItem(this.last7Days[i]));
      }

      if (collection.length > 0) {
        return collection;
      } else {
        return null;
      }
    } catch (err) {
      return;
    }
  }

  render() {
    return html`
      <app-header enableBack="${true}"></app-header>
      <div class="hero">
        <hero-decor></hero-decor>
        <!-- <pwa-install>Install Repose</pwa-install> -->
        <div class="hero__inner">
          <div class="hero__top-content">
            <h1>Intelligent Daily Mood Journal</h1>
            <p>Repose is your personal mood tracking companion that helps you organize and reflect upon your daily thoughts.</p>
            <fluent-anchor href="/journal" appearance="lightweight">Mood check-in</fluent-anchor>
            <div class="entries">
              <fluent-accordion-item class="main-accordion">
                <span slot="heading">See your past journals</span>
                <div class="panel">
                  ${this.renderEntries(this.last7DaysJournal ? this.last7DaysJournal : [])}
                </div>
              </fluent-accordion-item>
            </div>
          </div>
          <div class="hero__bottom-content">
          <img src="assets/media/humans.svg" alt="Humans">
          </div>
        </div>
      </div>
      <app-footer></app-footer>
    `;
  }

  renderEntries(entries: JournalEntry[][]) {
    return html`
      ${entries.map((entry: JournalEntry[]) => html`
        <fluent-accordion-item class="child-accordion">
          <span slot="heading">${entry&&entry[0].date ? `📆 Your thoughts from ${entry[0].date}` : 'Today'}</span>
          <div class="panel">
            ${entry ? entry.map((entry: JournalEntry) => html`
              <fluent-accordion-item class="child-accordion">
                <span slot="heading">${entry&&entry.time ? `📝 At ${entry.time} you wrote:` : ''}</span>
                <div class="panel">
                <p class="panel__title">${entry&&entry.title ? entry.title : ''}</p>
                <p class="panel__body">${entry&&entry.entry ? entry.entry : ''}</p>
                </div>
              </fluent-accordion-item>
            `) : 'Start journaling by clicking the "mood check-in" button 👆🏼'}
          </div>
        </fluent-accordion-item>
      `)}
    `;
  }
}
