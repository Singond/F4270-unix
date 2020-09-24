.PHONY: materials testdir clean

# Download study materials
materials:
	@echo "Copying study materials into 'materials/'"
	@mkdir -p materials
	wget --recursive --no-parent --no-directories --reject "index.html*" \
		--directory-prefix=materials \
		http://monoceros.physics.muni.cz/~zbona/unix/

# Prepare testing directory
testdir:
	mkdir -p test
	cp materials/*.csv materials/apollo materials/reakce test

# Clean the testing directory
clean:
	rm -rf test
