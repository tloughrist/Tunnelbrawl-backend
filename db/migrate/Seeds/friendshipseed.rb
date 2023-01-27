friendships = Friendship.create([
  {friender_id: User.first.id, friendee_id: User.second.id, status: "active"},
  {friender_id: User.first.id, friendee_id: User.third.id, status: "active"},
  {friender_id: User.fourth.id, friendee_id: User.first.id, status: "active"},
  {friender_id: User.fourth.id, friendee_id: User.second.id, status: "active"},
  {friender_id: User.third.id, friendee_id: User.second.id, status: "active"},
  {friender_id: User.fifth.id, friendee_id: User.first.id, status: "pending"},
  {friender_id: User.sixth.id, friendee_id: User.first.id, status: "blocked"},
  {friender_id: User.fourth.id, friendee_id: User.fifth.id, status: "active"},
  {friender_id: User.fourth.id, friendee_id: User.sixth.id, status: "active"},
  {friender_id: User.second.id, friendee_id: User.fifth.id, status: "active"},
  {friender_id: User.third.id, friendee_id: User.fourth.id, status: "active"},
  {friender_id: User.third.id, friendee_id: User.fifth.id, status: "active"},
]);

# Friends: (1,2),(1,3),(1,4),(1,5),(1,6),(2,3),(2,4)(2,5),(3,4),(3,5),(4,5),(4,6)