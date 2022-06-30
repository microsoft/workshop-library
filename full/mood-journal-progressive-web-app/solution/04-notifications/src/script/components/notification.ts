import { LitElement, css, html } from 'lit';
import { customElement } from 'lit/decorators.js';

@customElement('app-notification')
export class AppNotification extends LitElement {
  static get styles() {
    return css`
      .notification {
        z-index: 0;
        float: right;
        margin-top: 1rem;
        margin-right: 1rem;
      }
    `;
  }

  constructor() {
    super();
  }

  private requestNotificationPermission() {
    if ("Notification" in window) {
      console.log("Notifications API is supported");

      Notification.requestPermission().then(permission => {
        if (permission === 'granted') {
          console.log('Notification permission granted.');
        }
      });
    } else {
      console.log("Notifications API is not supported");
    }
  }

  private displayNotification() {
    const notifTitle = "Hi";
    const notifBody = "It's time to drink some water 💦";
    const notifImg = `assets/media/toast.jpg`;
    const options = {
      body: notifBody,
      icon: notifImg,
    };
    new Notification(notifTitle, options);
  }

  render() {
    return html`
      <div id="notification" class="notification">
        <fluent-button appearance="accent" @click=${this.requestNotificationPermission}>Request Permissions</fluent-button>
        <fluent-button appearance="accent" @click=${this.displayNotification}>Display Notifications</fluent-button>

      </div>
    `;
  }
}




