## Add your own custom Makefile targets here

RUN = poetry run

.PHONY: check-jsonschema-example run-linkml-validation check-all-invalid-examples check-all-valid-examples

JSON_SCHEMA_FILE := project/jsonschema/tank_schema.schema.json
INVALID_EXAMPLES_DIR := src/data/examples/invalid
INVALID_EXAMPLE_FILES := $(wildcard src/data/examples/invalid/*.yaml)
VALID_EXAMPLES_DIR := src/data/examples/valid
VALID_EXAMPLE_FILES := $(wildcard src/data/examples/valid/*.yaml)

# the check-jsonschema utility can be used to check JSON or YAML data
#  against the JSON schema generated from teh LinkML schema
# Future versions of LinkML will include reporting of all errors like check-jsonschema
#  at which time these tests will be rewritten
# see https://github.com/turbomam/examples-first-cookiecutter/issues/99

jsonschema-check-all-examples: check-all-invalid-examples check-all-valid-examples

check-all-invalid-examples: $(patsubst $(INVALID_EXAMPLES_DIR)/%.yaml,jsonschema-vs-invalid--%,$(INVALID_EXAMPLE_FILES))

jsonschema-vs-invalid--%: $(JSON_SCHEMA_FILE) $(INVALID_EXAMPLES_DIR)/%.yaml
	! $(RUN) check-jsonschema --schemafile $^

check-all-valid-examples: $(patsubst $(VALID_EXAMPLES_DIR)/%.yaml,jsonschema-vs-valid-%,$(VALID_EXAMPLE_FILES))

jsonschema-vs-valid-%: $(JSON_SCHEMA_FILE) $(VALID_EXAMPLES_DIR)/%.yaml
	$(RUN) check-jsonschema --schemafile $^


run-linkml-validation: src/tank_schema/schema/tank_schema.yaml \
src/data/examples/invalid/TankCollection-undefined-slot.yaml
	# TankCollection is assumed as the target-class because it has been defined as the tree_root in the schema
	- $(RUN) linkml-validate \
	  --schema $^


src/data/dh_vs_linkml_json/TankCollection_linkml_raw.yaml: src/data/dh_vs_linkml_json/Tank_dh.json
	$(RUN) dh-json2linkml \
		--input-file $< \
		--output-file $@ \
		--output-format yaml \
		--key entries

src/data/dh_vs_linkml_json/TankCollection_linkml_normalized.yaml: src/data/dh_vs_linkml_json/TankCollection_linkml_raw.yaml
	$(RUN) linkml-normalize \
		--schema src/tank_schema/schema/tank_schema.yaml \
		--output $@ \
		--no-expand-all $<

src/data/dh_vs_linkml_json/entries.json: src/data/dh_vs_linkml_json/TankCollection_linkml_normalized.yaml
	$(RUN) linkml-json2dh \
		--input-file $< \
		--input-format yaml \
		--output-dir $(dir $@)
