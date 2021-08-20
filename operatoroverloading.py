class Stringoperation:
    def __init__(self,value):
        self.value=value
    def __sub__(s1,s2):
        return len(s1.value)-len(s2.value)
    def __gt__(s1,s2):
        if len(s1.value)>len(s2.value):
            return True
        else:
            f=false
            return False
sobj1=Stringoperation("hello")
sobj2=Stringoperation("hi")
res=sobj1-sobj2
print(res)
res=sobj1>sobj2
print(res)