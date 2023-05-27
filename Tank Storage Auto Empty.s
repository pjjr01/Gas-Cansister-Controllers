settings:
alias storage d0
alias pump d1

turnoff:
s d1 On 0
s d1 Setting 100

test:
ls r1 storage 0 Occupied
beqz r1 turnoff
l r1 storage Pressure
beqz r1 turnoff

run:
s d1 On 1
s d1 Setting 100
j test