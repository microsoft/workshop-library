import { LitElement, css, html } from 'lit';
import { customElement } from 'lit/decorators.js';

@customElement('hero-decor')
export class HeroDecor extends LitElement {
    static get styles() {
        return css`
        .hero__decor {
            position: absolute;
            background-color: #45B08C;
            background-image: url('/assets/media/wave.webp');
            background-repeat: no-repeat;
            background-position: bottom;
            top: 0px;
            left: 0px;
            right: 0px;
            height: 45rem;
        }
        `;
    }
    
    constructor() {
        super();
    }
    
    render() {
        return html`
            <div class="hero__decor"></div>
        `;
    }
}
