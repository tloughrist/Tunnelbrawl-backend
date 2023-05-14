export default async function createGame(userId, title) {
  const res = await fetch(`/games`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      host_id: userId,
      title: title,
      no_players: 1,
      turn: "red",
      round: 1,
      phase: "move",
      status: "pending"
    }),
  });
  console.log(res)
  if (res.ok) {
    const pkg = await res.json();
    return pkg;
  } else {
    alert(res.errors);
  }
};