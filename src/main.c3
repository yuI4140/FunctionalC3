module functionaltest;
import std::io;

import functional;

fn int main() => @pool()
{
	List{int} list = {1, 2, 3, 4};

	list
		.for_each(fn(x) => x*2)
		.for_each(fn(x) => x*4)
		.printn();

	io::printf("number less than 10: %b\n", list.contains(fn(i) => i < 10));
	io::printf("number equal to 10: %b\n", list.contains(fn(i) => i == 10));
	io::printf("number equal to 8: %b\n", list.contains(fn(i) => i == 8));

	list.reverse().printn();

	usz num = list.find(fn(num) => num == 8)!!;
	io::print("number equal to 8 at position: ");
	io::printn(num);

	List{int} a = list.clone(tmem);

	List{int} new_list = list
		.map(fn(x) => x*2, tmem)
		.for_each(fn(x) => x*4);

	new_list.printn();	

	List{int} vals = list
		.filter(fn(num) => num > 23, tmem);
	vals.printn();


    vals[1] = 10;
    vals.printn();

	return 0;
}
