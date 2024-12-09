class Conversation {
  id: number = 0
  avatar: string = ""
  targetId: number = 0
  name: string = ""
  message: string = ""
  time: string = ""
  unreadCount: number = 0
  top: boolean = false
}

let MockConversations: Conversation[] = [
  {
    id: 1,
    avatar: "avatar1.jpg",
    targetId: 101,
    name: "Adventurous Alice",
    message: "Hello there!",
    time: "2024-10-28 10:00",
    unreadCount: 2,
    top: false
  },
  {
    id: 2,
    avatar: "avatar2.jpg",
    targetId: 102,
    name: "Brave Bob",
    message: "How are you?",
    time: "2024-10-28 10:15",
    unreadCount: 0,
    top: false
  },
  {
    id: 3,
    avatar: "avatar3.jpg",
    targetId: 103,
    name: "Charming Charlie",
    message: "Nice to meet you.",
    time: "2024-10-28 10:30",
    unreadCount: 1,
    top: true
  },
  {
    id: 4,
    avatar: "avatar4.jpg",
    targetId: 104,
    name: "Daring Daisy",
    message: "What's up?",
    time: "2024-10-28 10:45",
    unreadCount: 3,
    top: false
  },
  {
    id: 5,
    avatar: "avatar5.jpg",
    targetId: 105,
    name: "Energetic Eric",
    message: "Have a great day!",
    time: "2024-10-28 11:00",
    unreadCount: 0,
    top: false
  },
  {
    id: 6,
    avatar: "avatar6.jpg",
    targetId: 106,
    name: "Friendly Frank",
    message: "See you later.",
    time: "2024-10-28 11:15",
    unreadCount: 1,
    top: false
  },
  {
    id: 7,
    avatar: "avatar7.jpg",
    targetId: 107,
    name: "Gorgeous Grace",
    message: "Goodbye!",
    time: "2024-10-28 11:30",
    unreadCount: 2,
    top: true
  },
  {
    id: 8,
    avatar: "avatar8.jpg",
    targetId: 108,
    name: "Happy Henry",
    message: "How's it going?",
    time: "2024-10-28 11:45",
    unreadCount: 0,
    top: false
  },
  {
    id: 9,
    avatar: "avatar9.jpg",
    targetId: 109,
    name: "Intelligent Iris",
    message: "Take care.",
    time: "2024-10-28 12:00",
    unreadCount: 1,
    top: false
  },
  {
    id: 10,
    avatar: "avatar10.jpg",
    targetId: 110,
    name: "Jolly Jane",
    message: "Cheers!",
    time: "2024-10-28 12:15",
    unreadCount: 2,
    top: false
  },
  {
    id: 11,
    avatar: "avatar11.jpg",
    targetId: 111,
    name: "Kind Kevin",
    message: "Hi!",
    time: "2024-10-28 12:30",
    unreadCount: 0,
    top: false
  },
  {
    id: 12,
    avatar: "avatar12.jpg",
    targetId: 112,
    name: "Lively Lily",
    message: "How are things?",
    time: "2024-10-28 12:45",
    unreadCount: 1,
    top: true
  },
  {
    id: 13,
    avatar: "avatar13.jpg",
    targetId: 113,
    name: "Magnificent Max",
    message: "What's new?",
    time: "2024-10-28 13:00",
    unreadCount: 2,
    top: false
  },
  {
    id: 14,
    avatar: "avatar14.jpg",
    targetId: 114,
    name: "Noble Nancy",
    message: "Hello again!",
    time: "2024-10-28 13:15",
    unreadCount: 0,
    top: false
  },
  {
    id: 15,
    avatar: "avatar15.jpg",
    targetId: 115,
    name: "Optimistic Olivia",
    message: "Have a good one!",
    time: "2024-10-28 13:30",
    unreadCount: 1,
    top: false
  },
  {
    id: 16,
    avatar: "avatar16.jpg",
    targetId: 116,
    name: "Pleasant Paul",
    message: "See you soon.",
    time: "2024-10-28 13:45",
    unreadCount: 2,
    top: true
  },
  {
    id: 17,
    avatar: "avatar17.jpg",
    targetId: 117,
    name: "Quiet Quentin",
    message: "Good day!",
    time: "2024-10-28 14:00",
    unreadCount: 0,
    top: false
  },
  {
    id: 18,
    avatar: "avatar18.jpg",
    targetId: 118,
    name: "Radiant Rachel",
    message: "How's your day?",
    time: "2024-10-28 14:15",
    unreadCount: 1,
    top: false
  },
  {
    id: 19,
    avatar: "avatar19.jpg",
    targetId: 119,
    name: "Serene Sam",
    message: "Take it easy.",
    time: "2024-10-28 14:30",
    unreadCount: 2,
    top: false
  },
  {
    id: 20,
    avatar: "avatar20.jpg",
    targetId: 120,
    name: "Thoughtful Tina",
    message: "Cheers to you!",
    time: "2024-10-28 14:45",
    unreadCount: 0,
    top: false
  }
];

export {
  Conversation, MockConversations
}