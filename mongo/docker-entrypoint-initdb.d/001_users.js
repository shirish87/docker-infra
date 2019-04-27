
db.createUser({
  user: 'admin2',
  pwd: 'password2',
  roles: [
    { role: 'readWrite', db: 'db' },
  ]
});
