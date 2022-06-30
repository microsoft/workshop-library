import { JournalEntry } from "../interfaces/journalEntry";

export const dbName: string = "journal_entries";

export function getTodaysDate(): string {
  let date = new Date();
  return formateDate(date);
}

export function getLast7Days(): string[] {
  let last7Days: string[] = [];
  let date = new Date();
  for(let i = 0; i < 7; i++) {
    last7Days.push(formateDate(date));
    date.setDate(date.getDate() - 1);
  }

  return last7Days;
}

export function getCurrentTime(): string {
  let date = new Date();
  return date.getHours().toString() + ":" + date.getMinutes().toString();
}

export function seedLocalStorage(db: any) {
  const last7Days = getLast7Days();
  const journalEntries: JournalEntry[] = [
    {
      date: last7Days[1],
      time: "12:30",
      title: "Build a stronger self",
      entry: "When we are faced with problems in our lives there are two different things we can do. We can stumble over them and let them hurt us; we can let them impact us negatively. Or we have the ability to learn from these moments. We can use them as building blocks to build a better, stronger us."
    },
    {
      date: last7Days[2],
      time: "13:00",
      title: "Today is going to be a good day 🧠",
      entry: "Building the PWA workshop and learning about new technologies is going to be fun!"
    },
    {
      date: last7Days[3],
      time: "13:30",
      title: "Found a great quote...",
      entry: "You've gotta dance like there's nobody watching, Love like you'll never be hurt, Sing like there's nobody listening, And live like it's heaven on earth. --William W. Purkey"
    },
    {
      date: last7Days[4],
      time: "14:00",
      title: "Feeling grateful",
      entry: "Going on vacation in a couple of days with friends. Will enjoy plenty of sunshine, good food, and lots of rest. "
    },
    {
      date: last7Days[5],
      time: "14:30",
      title: "Here is the best resource to learn about PWA",
      entry: "30 Days of PWA -> https://aka.ms/learn-pwa/30days-blog"
    },
    {
      date: last7Days[6],
      time: "15:00",
      title: "Hi there!",
      entry: "👀"
    }
  ];

  for(let i = 0; i < journalEntries.length; i++) {
    let journalEntry: JournalEntry = journalEntries[i];
    db.setItem(journalEntry.date, [journalEntry]);
  }
}

function formateDate(date: Date) {
  return ((date.getMonth() + 1) as number).toString() + "/" + date.getDate().toString() + "/" + date.getFullYear().toString(); 
}