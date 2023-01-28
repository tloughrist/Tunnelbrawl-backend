users = User.create([
  { name: 'Albert Camus', username: 'acamus', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Jean-Paul Sartre', username: 'jpsartre', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Simone de Beauvoir', username: 'sdebeauvoir', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Herbert Marcuse', username: 'hmarcuse', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Maurice Merleau-Ponty', username: 'mmerleauponty', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Franz Brentano', username: 'fbrentano', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Edmund Husserl', username: 'ehusserl', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Jacques Lacan', username: 'jlacan', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Avital Ronell', username: 'aronell', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Judith Butler', username: 'jbutler', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Martha Nussbaum', username: 'mnussbaum', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Andrea Dworkin', username: 'adworkin', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' },
  { name: 'Jacques Derrida', username: 'jderrida', password_digest: User.digest('proxy'), email: 'tim.loughrist@gmail.com' }
])