
from random import shuffle
import click


@click.command()
@click.option('--startnumber', '-s', default=1, required=True, help='begin range  number. default: 1')
@click.option('--endnumber', '-e', default=10, required=True, help='end range  number. default: 10')


def main(startnumber,endnumber):
	"""
	Function will print random number list from given range
	"""
	ordered_list = list(range(startnumber,endnumber+1))
	shuffle(ordered_list)
	for item in ordered_list:
		print(item)


if __name__ == '__main__':
	main()
