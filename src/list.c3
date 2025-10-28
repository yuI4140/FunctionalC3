module list {Tipo};
import std::io;

alias Type = Tipo;

alias ApplyCallback = fn Type (Type);


fn Type[] Type[].clone(Type[] self, Allocator allocator)
{
    Type* clone = malloc(self.len * Type.sizeof);
    foreach (i, val : self)
    {
        clone[i] = val;
    }

    return clone[:self.len];
}

fn void Type[].free(Type[] self, Allocator allocator)
{
    free(self);
}

fn void Type[].printn(Type[] self)
{
    io::printn(self);
}

fn Type[] Type[].for_each(Type[] self, ApplyCallback func)
{
    foreach (i, val : self)
    {
        self[i] = func(val);
    }

    return self;
}

fn Type[] Type[].map(Type[] self, ApplyCallback func, Allocator allocator)
{
    Type[] clone = self.clone(allocator);

    foreach (i, val : self)
    {
        clone[i] = func(val);
    }

    return clone;
}

alias ApplyConditionalCallback = fn bool (Type);

fn Type[] Type[].filter(Type[] self, ApplyConditionalCallback func, Allocator allocator)
{
    Type[] clone = self.clone(allocator);

    usz counter = 0;
    for (usz i = 0; i < self.len; i++)
    {
        if (func(self[i]))
        {
            clone[counter] = self[i];
            counter++;
        }
    }

    clone = ((Type*)realloc(clone, counter * Type.sizeof))[:counter];

    return clone;
}

fn bool Type[].contains(Type[] self, ApplyConditionalCallback func)
{
    for (usz i = 0; i < self.len; i++)
    {
        if (func(self[i]))
        {
            return true;
        }
    }
    return false;
}

fn usz? Type[].find(Type[] self, ApplyConditionalCallback func)
{
    for (usz i = 0; i < self.len; i++)
    {
        if (func(self[i]))
        {
            return i;
        }
    }
    return err::NOT_FOUND?;
}

fn Type[] Type[].reverse(Type[] self)
{
    for (usz i = 0; i < self.len / 2; i++)
    {
        Type tmp = self[i];
        self[i] = self[self.len - 1 - i];
        self[self.len - 1 - i] = tmp;
    }
    return self;
}

fn void Type[].count(Type[] self, ApplyConditionalCallback func)
{
    //TODO
}

fn void Type[].chain(Type[] self, ApplyConditionalCallback func)
{
    //TODO
}

fn void Type[].sort(Type[] self, ApplyConditionalCallback func)
{
    //TODO
}