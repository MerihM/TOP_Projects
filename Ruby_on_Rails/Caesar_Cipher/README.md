# Caesar cipher

I was in a hurry when I wrote this. It can be written far, far better. If I remember this project, I'll return to this code to refactor it.

Idea was to take message and number that represents shift in letters, ie. 5 would shift letter a to be letter f. First, message is converted to array of letters, because I found it easier to work with individual letters than whole message or words. Also, every letter is made to be lowercase. Indices of capital letters are put in separate array, so that encrypted message can have capital letters on same positions. 