import sys

def main():
	root = sys.argv[1].replace(" ", "\ ")
	tags = sys.argv[2:]

	if len(sys.argv[2:]) == 0:
		# print(1, file=sys.stderr)
		# sys.exit()
		print(1)
		sys.exit()

	tags_file = open(root + "/.fish_tags", "a")
	abbr_file = open("/Users/vegardlandsverk/.config/fish/conf.d/file_abbr.fish", "a")

	for tag in tags:
		abbr_file.write("\nabbr -a -g {} \"{}\"".format(tag, root))
		tags_file.write(" {}".format(tag))

	print(0)

main()