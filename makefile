.PHONY: materials
materials:
	@echo "Copying study materials into 'materials/'"
	@mkdir -p materials
	wget --recursive --no-parent --no-directories --reject "index.html*" \
		--directory-prefix=materials \
		http://monoceros.physics.muni.cz/~zbona/unix/
