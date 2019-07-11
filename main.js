let fetch = require('node-fetch')

fetch("https://learn.co/api/v1/assignments/admin/assignments/search",
  {"credentials":"include","headers":{"accept":"application/json, text/plain, */*",
   "accept-language":"en-US,en;q=0.9","content-type":"application/json;charset=UTF-8","x-csrf-token":"F3yP39wG9P/My6pa2NRuif0WkMvDhRN+Bd/mvW962tayIYeXh6ydFNBG21AqfaLxjkAgahRcE5lEy+IO/eo3YQ=="},"referrer":"https://learn.co/admin/assignments/search/assignments","referrerPolicy":"no-referrer-when-downgrade","body":"{\"assignment_title\":\"\",\"collaborator_ids\":[],\"published\":false,\"draft\":false,\"ended\":false}","method":"POST","mode":"cors"})
.then(res => res.json())
.then(data => {
  console.log(data)
})
