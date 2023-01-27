messages = Message.create([
  {sender_id: User.first.id, receiver_id: User.second.id, content: "Want to start a new game?" };
  {sender_id: User.first.id, receiver_id: User.third.id, content: "Good game!" };
  {sender_id: User.second.id, receiver_id: User.first.id, content: "Sure, when?", response_id: Message.first.id };
  {sender_id: User.first.id, receiver_id: User.second.id, content: "Tonight?", response: Message.third.id };
  {sender_id: User.third.id, receiver_id: User.first.id, content: "Thanks!", response_id: Message.second.id };
  {sender_id: User.fourth.id, receiver_id: User.fifth.id, content: "Want to start a new game?" };
  {sender_id: User.fourth.id, receiver_id: User.sixth.id, content: "Want to start a new game?" };
])

# Friends: (1,2),(1,3),(1,4),(1,5),(1,6),(2,3),(2,4)(2,5),(3,4),(3,5),(4,5),(4,6)