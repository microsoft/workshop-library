import { LitElement, css, html } from 'lit';
import { property, customElement } from 'lit/decorators.js';

@customElement('app-header')
export class AppHeader extends LitElement {
  @property({ type: String }) title = 'Repose';

  @property() enableBack: boolean = false;

  static get styles() {
    return css`
      header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: var(--app-color-primary);
        color: #333333;
        height: 4em;
        margin: 0 4rem;
      }

      header fluent-anchor::part(control) {
        text-decoration: none;
        font-size: 20px;
      }

      header fluent-anchor::part(control):hover {
        color: #45B08C;
      }
    `;
  }

  constructor() {
    super();
  }

  updated(changedProperties: any) {
    if (changedProperties.has('enableBack')) {
    }
  }

  render() {
    return html`
      <header>
        <div>
          ${this.enableBack ? html`<fluent-anchor appearance="hypertext" href="/">
            ${this.title}
          </fluent-anchor>` : html`<h2>${this.title}</h2>`}
        </div>
      </header>
    `;
  }
}
