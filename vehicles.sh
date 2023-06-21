#!/usr/bin/env bash

rm -f schema.yaml tank.yaml

cat << EOF > schema1.yaml
id: http://example.org/tank
prefixes:
  linkml: https://w3id.org/linkml/
imports:
  - linkml:types
default_range: string

slots:
  wheels:
    required: true
  chains:
    is_a: wheels
    required: true
classes:
  Vehicle:
    slots:
      - wheels
  Tank:
    is_a: Vehicle
    slots:
      - chains
    slot_usage:
      chains:
        required: true
EOF

cat << EOF > schema2.yaml
id: http://example.org/tank
prefixes:
  linkml: https://w3id.org/linkml/
imports:
  - linkml:types
default_range: string

slots:
  wheels:
    required: true
  chains:
    is_a: wheels
    required: true
classes:
  Vehicle:
    slots:
      - wheels
  Tank:
    is_a: Vehicle
    slots:
      - chains
    slot_usage:
      wheels:
        required: false
      chains:
        required: true
EOF

cat << EOF > tank1.yaml
chains: something
EOF

cat << EOF > tank2.yaml
wheels: something
chains: something
EOF

cat << EOF > tank3.yaml
wheels: something
EOF

for i in 1 2 3 ; do
    if [ $i -eq 1 ] ; then
        echo -n "🟢 "
    else
        echo -n "🔴 "
    fi
    echo "tank$i.yaml"
    echo "vvvvvvvvvvvvvvvvvv"
    cat tank$i.yaml
    echo "^^^^^^^^^^^^^^^^^^"
    for j in 1 2 ; do
        echo -n "    schema$j: "
        linkml-validate --target-class Tank --schema schema$j.yaml tank$i.yaml 2>&1 | tail -n 1
    done
done

