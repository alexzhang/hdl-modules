#!/usr/bin/env python

lsfr = 1 # starting value
counter = 0
for i in range(0,49999999): # 100 / 2 - 1
    counter = counter + 1

    # polynomial 26, 6, 2, 1
    tap1 = lsfr & (1 << 0)
    tap2 = lsfr & (1 << 1)
    tap3 = lsfr & (1 << 5)
    tap4 = lsfr & (1 << 25)

    temp = ((lsfr & 33554431) << 1) # 2^25 - 1
    lsfr = temp | (bool(tap1) ^ bool(tap2) ^ bool(tap3) ^ bool(tap4))

print((lsfr, counter))
