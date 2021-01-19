# enigma
2011BE Mod1 - Final Project

Monday 5pm Evaluation Rubric

### Functionality - 3
- Enigmal class with encrypt and decrypt methods successfully implemented.
- Encrypt/decrypt command line interfaces successfully implemented
- The crack method was something considered, but logically could not wrap my head around it. So no code for 4.

### Object Oriented Programming - 3.5
- Some classes are a little short, in particular I would combine encrption/decrpytion classes with enigma or eachother on the next iteration of Enigma.
- There was logicl breakdown and flow of information. Module was used.

### Ruby Conventions and Mechanics - 3.75
- Code is readable and logical
- All methods have single responsibility
- All methods are under 8 lines
- All classes are under 100 lines
- Most enumerables are best for the case

### Test Driven Development - 3
- Test coverage metrics are at 100%
- Edge cases are accounted for
- All module methods are tested on classes its included in
- Simplecov evaluating lib/decryption file (2) times, one tests at 100% one at 46%. I believe my tests are complete, and this is an error on simplecov that I was not able to debug.

### Version Control - 3.5
- Over 85 commits
- Beginning of project did not use branch for first few commits, corrected behavior for remainder of the project

TO DO =
- [x] Add more tests for edge cases
- [x] Rename user_input class to user_info_transfer
- [ ] merge decrpytion and encryption?
