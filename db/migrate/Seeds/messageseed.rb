messages = Message.create([
  {sender_id: 1, receiver_id: 2, content: "Want to start a new game?" };
  {sender_id: 1, receiver_id: 3, content: "Good game!" };
  {sender_id: 2, receiver_id: 1, content: "Sure, when?", response_id: 1 };
  {sender_id: 1, receiver_id: 2, content: "Tonight?", response_id: 3 };
  {sender_id: 3, receiver_id: 1, content: "Thanks!", response_id: 2 };
  {sender_id: 4, receiver_id: 5, content: "Want to start a new game?" };
  {sender_id: 4, receiver_id: 6, content: "Want to start a new game?" };
])