class ComponentType {
  final String typeName;
  ComponentType(this.typeName);

  String toTypeString() {
    return typeName;
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}

class GenericType extends ComponentType {
  final List<ComponentType> genericParameters;

  GenericType(String typeName, this.genericParameters) : super(typeName);

  @override
  String toTypeString() {
    var joinedTypeParameters =
        genericParameters.map((t) => t.toTypeString()).join(",");
    return "${capitalize(typeName)}<${joinedTypeParameters}>";
  }
}

class ArrayType extends ComponentType {
  final ComponentType innerType;

  ArrayType(this.innerType) : super(innerType.typeName);

  @override
  String toTypeString() {
    return "${capitalize(typeName)}[]";
  }
}

class GenericParameterType extends ComponentType {
  final ComponentType extendsType;

  GenericParameterType(String typeName, [this.extendsType]) : super(typeName);

  @override
  String toTypeString() {
    if (extendsType == null){
      return typeName;
    } 
    return "${capitalize(typeName)} extends ${extendsType.toTypeString()}";
  }
}

class GenericDefinitionType extends ComponentType {
  final List<GenericParameterType> genericParameters;

  GenericDefinitionType(String typeName, [this.genericParameters = const []]) : super(typeName);

  @override
  String toTypeString() {
    var joinedTypeParameters =
        genericParameters.map((t) => t.toTypeString()).join(",");
    return "${capitalize(typeName)}<${joinedTypeParameters}>";
  }
}
