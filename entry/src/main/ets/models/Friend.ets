
class Friend {
  id: number = 0
  avatar: string = ""
  name: string = ""
}

let MockFriends: Friend[] = [
  {
    id: 1,
    avatar: "avatar1.jpg",
    name: "Enigmatic Ethan"
  },
  {
    id: 2,
    avatar: "avatar2.jpg",
    name: "Vibrant Vivian"
  },
  {
    id: 3,
    avatar: "avatar3.jpg",
    name: "Dynamic Daisy"
  },
  {
    id: 4,
    avatar: "avatar4.jpg",
    name: "Charming Chloe"
  },
  {
    id: 5,
    avatar: "avatar5.jpg",
    name: "Brave Benjamin"
  },
  {
    id: 6,
    avatar: "avatar6.jpg",
    name: "Graceful Grace"
  },
  {
    id: 7,
    avatar: "avatar7.jpg",
    name: "Intrepid Ian"
  },
  {
    id: 8,
    avatar: "avatar8.jpg",
    name: "Radiant Rebecca"
  },
  {
    id: 9,
    avatar: "avatar9.jpg",
    name: "Tenacious Thomas"
  },
  {
    id: 10,
    avatar: "avatar10.jpg",
    name: "Luminous Lily"
  },
  {
    id: 11,
    avatar: "avatar11.jpg",
    name: "Adventurous Alex"
  },
  {
    id: 12,
    avatar: "avatar12.jpg",
    name: "Fascinating Fiona"
  },
  {
    id: 13,
    avatar: "avatar13.jpg",
    name: "Daring Daniel"
  },
  {
    id: 14,
    avatar: "avatar14.jpg",
    name: "Elegant Emma"
  },
  {
    id: 15,
    avatar: "avatar15.jpg",
    name: "Courageous Cameron"
  },
  {
    id: 16,
    avatar: "avatar16.jpg",
    name: "Sweet Sophia"
  },
  {
    id: 17,
    avatar: "avatar17.jpg",
    name: "Resolute Ryan"
  },
  {
    id: 18,
    avatar: "avatar18.jpg",
    name: "Gorgeous Gabriella"
  },
  {
    id: 19,
    avatar: "avatar19.jpg",
    name: "Audacious Audrey"
  },
  {
    id: 20,
    avatar: "avatar20.jpg",
    name: "Noble Noah"
  }
];

class FriendGroupByFirstLetter {
  title: string = "A"
  friends: Friend[] = []
  key: string = ""
}

function groupFriendsByFirstLetter(friends: Friend[]): FriendGroupByFirstLetter[] {
  class TempData {
    letter: FriendGroupByFirstLetter = {
      title: '',
      friends: [],
      key: ''
    }
  }

  let dataList: TempData[] = []
  for (let friend of friends) {
    let firstLetter = friend.name.charAt(0).toUpperCase()
    let data = dataList.find(x => x.letter.title == firstLetter)
    if (data) {
      data.letter.friends.push(friend)
    } else {
      let newTempData = new TempData()
      newTempData.letter.title = firstLetter
      newTempData.letter.friends.push(friend)
      newTempData.letter.key = "123"
      dataList.push(newTempData)
    }
  }
  let result = dataList.map(x => x.letter)
  result.sort((a, b) => a.title.charCodeAt(0) - b.title.charCodeAt(0))
  return result
}

let MockFriendGroupByFirstLetters: FriendGroupByFirstLetter[] = groupFriendsByFirstLetter(MockFriends)

export {
  Friend, MockFriends, FriendGroupByFirstLetter, MockFriendGroupByFirstLetters
}