# TODO
i. Hit an API to fetch the data for the User Details section i.e. the UI elements above “Recommended for you” section. You can use any mocking server of your choice to create the API yourself.
ii. For the “Recommended for you” section, hit the following api:
    http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all
iii. Add loading spinners/error states as necessary.
iv. Please use a state management library of your choice.
v. (Bonus for freshers, mandatory for experienced) The api mentioned in point ii (tournaments_list_v2) supports pagination, where you specify how many results you wish to receive using the limit parameter (say 10), then fetch the subsequent 10 items by specifying a cursor param in the subsequent api hit. This cursor param is to be picked from the response of preceding api hit. For example:
  http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all&cursor=CmMKGQoMcmVnX2VuZF9kYXRlEgkIgLTH_rqS7AISQmoOc35nYW1lLXR2LXByb2RyMAsSClRvdXJuYW1lbnQiIDIxMDQ5NzU3N2UwOTRmMTU4MWExMDUzODEwMDE3NWYyDBgAIAE=
  The relevant data points from the above are: name, cover_url, game_name. Please implement infinite scroll for the above api


  Not Done Slivers, Because It was mentioned