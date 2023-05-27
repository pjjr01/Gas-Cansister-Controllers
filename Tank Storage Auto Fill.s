settings:
alias storage d0
alias pump d1
alias regulator d2
define Max 19000
# Change the number next to Max to control pressure
turnoff:
s d1 On 0
s d1 Setting 50
s d2 On 0
s d2 Setting Max
j test

stand:
s d1 On 0
s d1 Setting 50
s d2 On 1
j test

test:
ls r1 storage 0 Occupied
beqz r1 turnoff
l r2 storage Pressure
sub r3 Max 200
bgeal r2 r3 stand
sub r3 Max 10000
ble r2 r3 fastfill
sub r3 Max 5000
ble r2 r3 medfill
sub r3 Max 2000
ble r2 r3 slowfill
sub r3 Max 500
ble r2 r3 vslowfill
j stand

fastfill:
s d1 Setting 60
s d1 On 1
s d2 On 1
s d2 Setting Max
j test

medfill:
s d1 Setting 40
s d1 On 1
s d2 On 1
s d2 Setting Max
j test

slowfill:
s d1 Setting 10
s d1 On 1
s d2 On 1
s d2 Setting Max
j test

vslowfill:
s d1 Setting 3
s d1 On 1
s d2 On 1
s d2 Setting Max
j test