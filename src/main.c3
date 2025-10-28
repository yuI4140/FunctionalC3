module funcitonal;
import std::io;

import list;

alias FunctionalIntSlice = list::Type {int};
alias FunctionalFloatSlice = list::Type {float};

fn int main() => @pool()
{
	int[] list = {1, 2, 3, 4};

	list
		.for_each(fn(x) => x*2)
		.for_each(fn(x) => x*4)
		.printn();

	io::print("number less than 10: ");
	io::printn(list.contains(fn(i) => i < 10));
	io::print("number equal to 10: ");
	io::printn(list.contains(fn(i) => i == 10));
	io::print("number equal to 8: ");
	io::printn(list.contains(fn(i) => i == 8));

	list.reverse().printn();

	usz num = list.find(fn(num) => num == 8)!!;
	io::print("number equal to 8 at position: ");
	io::printn(num);

	int[] a = list.clone(tmem);

	int[] new_list = list
		.map(fn(x) => x*2, tmem)
		.for_each(fn(x) => x*4);

	new_list.printn();	

	int[] vals = list
		.filter(fn(num) => num > 23, tmem);
	vals.printn();

	return 0;
}
