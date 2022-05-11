import { LitElement, css, html } from 'lit';
import { customElement, property, query } from 'lit/decorators.js';
import localforage from 'localforage';
import { JournalEntry } from '../interfaces/journalEntry';
import { dbName, getTodaysDate, getCurrentTime } from '../utils/journal';

@customElement('app-journal')
export class AppJournal extends LitElement {
  @property() journalDB: any;
  @property() titlePlaceholder: string = "Title...";
  @property() journalPlaceholder: string = "Add some thoughts, feelings, or ideas here...";

  static get styles() {
    return css`
      .main {
        padding: 0 48px;
        position: relative;
      }

      .journal {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      .journal h1 {
        color: #fff;
        font-weight: 200;
        z-index: 0;
        margin: 4rem 0 3rem;
      }

      .journal__slider {
        margin-bottom: 4rem;
      }

      .journal__slider fluent-slider {
        min-width: 400px;
      }

      .journal__slider fluent-slider::part(track-container) {
        background: #fff;
        border: none;
      }

      .journal__slider fluent-slider-label {
        font-size: 1.5rem;
      }

      .journal__title fluent-text-field {
        width: 66vw;
        font-size: 1.5rem;
      }

      .journal__content fluent-text-area::part(control) {
        width: 66vw;
        height: 40vh;
        font-size: 1rem;
      }

      .journal__title fluent-text-field::part(root) {
        line-height: 4rem;
        height: 4rem;
      }

      .journal__title fluent-text-field::part(root),
      .journal__content fluent-text-area::part(control) {
        -webkit-backdrop-filter: blur(20px);
        background: none;
        backdrop-filter: blur(20px);
        background-color: rgba(255,255,255,.3);
      }

      fluent-button {
        border-radius: 15px;
        color: #45B08C;  
      }

      .submit fluent-button {
        width: 10em;
        margin: 25px;       
      }

      .submit fluent-button::part(control):hover {
        color: #fff;
      }

      fluent-button::part(control):hover {
        color: #02452d;
      }

      fluent-dialog::part(control) {
        max-height: 150px;
        max-width: 70vw;
        padding: 10px;  
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        border-radius: 15px;
        background-image: linear-gradient(to bottom, #45B08C, #78c7ad);
        color: white;   
        border: none;
      }

      fluent-dialog::part(overlay) {
        background: rgba(0, 0, 0, 0.6);
      }

      fluent-dialog h4 {
        text-align: center;
        margin-left: 5px;
        margin-right: 5px;
        font-weight: 400;
      }

      @media screen and (max-width: 625px){
        .journal h1 {
          margin: 2rem 0px;
        }

        .journal__title fluent-text-field,
        .journal__content fluent-text-area::part(control) {
          width: 85vw;
        }

        .journal__slider fluent-slider {
          min-width: 300px;
        }

        .journal__content fluent-text-area::part(control) {
          height: 30vh;
        }
      }

      @media screen and (max-width: 375px){
        app-footer {
          display: none;
        }
      }
    `;
  }

  constructor() {
    super();
    this.journalDB = localforage.createInstance({name: dbName});
  }

  private async submitEntry() {
    let entry: JournalEntry = this.createJournalEntry();
    let entryCollection = await this.getEntryCollection(entry.date);

    if(entry.title) {
      this.pushNewEntry(entryCollection, entry);
      this.clearJournalFields();
    } else {
      this.showWarningDialog()
    }
  }

  private createJournalEntry(): JournalEntry {
    let today: string = getTodaysDate();
    let currentTime: string = getCurrentTime();

    let journalEntry: JournalEntry = {
      date: today,
      time: currentTime,
      title: this.titleInput.value,
      entry: this.journalInput.value
    }

    return journalEntry;
  }

  private async getEntryCollection(date: string) {
    let entryCollection = await this.journalDB.getItem(date);
    return entryCollection == null ? [] : entryCollection;
  }

  private pushNewEntry(entryCollection: any, entry: JournalEntry) {
    entryCollection.push(entry);
    this.journalDB.setItem(entry.date, entryCollection);
  }

  private clearJournalFields() {
    this.titleInput.value = "";
    this.journalInput.value = "";
  }

  private showWarningDialog() {
    this.errorDialog.hidden = false;
  }

  private dismissWarningDialog() {
    this.errorDialog.hidden = true;
  }

  @query('#titleInput')
  titleInput!: HTMLInputElement;

  @query('#journalInput')
  journalInput!: HTMLInputElement;

  @query('#errorDialog')
  errorDialog!: HTMLElement;
  

  render() {
    return html`
      <app-header enableBack="${true}"></app-header>
      
      <div class="main">
        <hero-decor></hero-decor>
        <div class="journal">
          <h1>Hello there! How are you today?</h1>
          <div class="journal__slider">
            <fluent-slider min="0" max="100" value="50" step="5" title="Select your emotion">
              <fluent-slider-label position="0">
                😔
              </fluent-slider-label>
              <fluent-slider-label position="25">
                😕
              </fluent-slider-label>
              <fluent-slider-label position="50">
                🙂
              </fluent-slider-label>
              <fluent-slider-label position="75">
                😀
              </fluent-slider-label>
              <fluent-slider-label position="100">
                🤩
              </fluent-slider-label>
            </fluent-slider>
          </div>
          <div class="journal__title">
            <fluent-text-field id="titleInput" appearance="lightweight" placeholder=${this.titlePlaceholder}>
            </fluent-text-field>
          </div>
          <div class="journal__content">
            <fluent-text-area  id="journalInput" appearance="lightweight" placeholder=${this.journalPlaceholder}> 
            </fluent-text-area>
          </div>
          <div class="submit">
            <fluent-button appearance="accent" @click=${this.submitEntry}>
              Complete check-in
            </fluent-button>
          </div>
        </div>

        <fluent-dialog id="errorDialog" hidden=${true}>
          <h4> Make sure to add a title for your daily mood journal.</h4>
          <fluent-button appearance="lightweight" @click=${this.dismissWarningDialog}>
            Try Again
          </fluent-button>
        </fluent-dialog>

      </div>
      <app-footer></app-footer>
    `;
  }
}
