import { LitElement, css, html } from 'lit';
import { customElement } from 'lit/decorators.js';

@customElement('app-footer')
export class AppFooter extends LitElement {
  static get styles() {
    return css`
      .footer {
        background-color: #FAE8E0;
        height: 40px;
        z-index: 0;
        position: absolute;
        text-align: center;
        bottom: 0;
        left: 0;
        right: 0;
      }

      .footer span {
        line-height: 40px;
      }
    `;
  }

  constructor() {
    super();
  }

  render() {
    return html`
      <section id="footer" class="footer">
        <span>© Repose 2022</span>
      </section>
    `;
  }
}


