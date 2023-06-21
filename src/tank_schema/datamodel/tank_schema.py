# Auto generated from tank_schema.yaml by pythongen.py version: 0.9.0
# Generation date: 2023-06-20T21:12:01
# Schema: tank
#
# id: http://example.org/tank
# description:
# license: https://creativecommons.org/publicdomain/zero/1.0/

import dataclasses
import re
from jsonasobj2 import JsonObj, as_dict
from typing import Optional, List, Union, Dict, ClassVar, Any
from dataclasses import dataclass
from linkml_runtime.linkml_model.meta import EnumDefinition, PermissibleValue, PvFormulaOptions

from linkml_runtime.utils.slot import Slot
from linkml_runtime.utils.metamodelcore import empty_list, empty_dict, bnode
from linkml_runtime.utils.yamlutils import YAMLRoot, extended_str, extended_float, extended_int
from linkml_runtime.utils.dataclass_extensions_376 import dataclasses_init_fn_with_kwargs
from linkml_runtime.utils.formatutils import camelcase, underscore, sfx
from linkml_runtime.utils.enumerations import EnumDefinitionImpl
from rdflib import Namespace, URIRef
from linkml_runtime.utils.curienamespace import CurieNamespace
from linkml_runtime.linkml_model.types import String

metamodel_version = "1.7.0"
version = None

# Overwrite dataclasses _init_fn to add **kwargs in __init__
dataclasses._init_fn = dataclasses_init_fn_with_kwargs

# Namespaces
LINKML = CurieNamespace('linkml', 'https://w3id.org/linkml/')
TANK = CurieNamespace('tank', 'http://example.org/tank/')
DEFAULT_ = TANK


# Types

# Class references



@dataclass
class Vehicle(YAMLRoot):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = TANK.Vehicle
    class_class_curie: ClassVar[str] = "tank:Vehicle"
    class_name: ClassVar[str] = "Vehicle"
    class_model_uri: ClassVar[URIRef] = TANK.Vehicle

    wheels: str = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.wheels):
            self.MissingRequiredField("wheels")
        if not isinstance(self.wheels, str):
            self.wheels = str(self.wheels)

        super().__post_init__(**kwargs)


@dataclass
class Tank(Vehicle):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = TANK.Tank
    class_class_curie: ClassVar[str] = "tank:Tank"
    class_name: ClassVar[str] = "Tank"
    class_model_uri: ClassVar[URIRef] = TANK.Tank

    chains: str = None
    wheels: str = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.chains):
            self.MissingRequiredField("chains")
        if not isinstance(self.chains, str):
            self.chains = str(self.chains)

        if self._is_empty(self.wheels):
            self.MissingRequiredField("wheels")
        if not isinstance(self.wheels, str):
            self.wheels = str(self.wheels)

        super().__post_init__(**kwargs)


@dataclass
class TankCollection(YAMLRoot):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = TANK.TankCollection
    class_class_curie: ClassVar[str] = "tank:TankCollection"
    class_name: ClassVar[str] = "TankCollection"
    class_model_uri: ClassVar[URIRef] = TANK.TankCollection

    tanks: Optional[Union[Union[dict, Tank], List[Union[dict, Tank]]]] = empty_list()

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if not isinstance(self.tanks, list):
            self.tanks = [self.tanks] if self.tanks is not None else []
        self.tanks = [v if isinstance(v, Tank) else Tank(**as_dict(v)) for v in self.tanks]

        super().__post_init__(**kwargs)


# Enumerations


# Slots
class slots:
    pass

slots.wheels = Slot(uri=TANK.wheels, name="wheels", curie=TANK.curie('wheels'),
                   model_uri=TANK.wheels, domain=None, range=str)

slots.chains = Slot(uri=TANK.chains, name="chains", curie=TANK.curie('chains'),
                   model_uri=TANK.chains, domain=None, range=str)

slots.tanks = Slot(uri=TANK.tanks, name="tanks", curie=TANK.curie('tanks'),
                   model_uri=TANK.tanks, domain=None, range=Optional[Union[Union[dict, Tank], List[Union[dict, Tank]]]])

slots.Tank_wheels = Slot(uri=TANK.wheels, name="Tank_wheels", curie=TANK.curie('wheels'),
                   model_uri=TANK.Tank_wheels, domain=Tank, range=str)

slots.Tank_chains = Slot(uri=TANK.chains, name="Tank_chains", curie=TANK.curie('chains'),
                   model_uri=TANK.Tank_chains, domain=Tank, range=str)