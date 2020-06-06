m = {a = 25, b = 'b', c={ca='ca',cb='cb'}};

s = {b = 'c',c={ca='sa'}};

s2 = {};

setmetatable( s, m );
m.__index = m;
sc = s.c;
mc = m.c
setmetatable( sc, mc );
mc.__index = mc;

setmetatable( s2, s );
s.__index = s;

print( s.c.ca );
print( s.c.cb );
