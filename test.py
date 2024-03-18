def pyramide(n):
    for i in range(n):
        print(" "*(n-i) + "".join(["* " for a in range(i)]) + " "*(n-i-1))
    
pyramide(5)
