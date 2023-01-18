# Substring

Demonstration of finding substring in entered string. 

User will be prompted to enter word or sentence. Afterwards, that string will be passed in method `substring` which will compare whole string with predetermined dictionary. For every word in dictionary that is found in string hash value will be incremented by one. At the end, hash of words from dictionary found in string will be displayed. Keys will be words themselves, while values will be count.

There is a bug, where it will count only first substring that is found. If word with multiple same substring is entered, count will only go up by one. Maybe use `scan` method?