abstract class ProductRequestStates{

}

class ProductRequestInitialState extends ProductRequestStates{

}





class ProductRequestLoadingState extends ProductRequestStates {}
class  ProductRequestSuccessState extends ProductRequestStates {}
class  ProductRequestErrorState extends ProductRequestStates {}


class ProductAcceptLoadingState extends ProductRequestStates {}
class  ProductAcceptSuccessState extends ProductRequestStates {}
class  ProductAcceptErrorState extends ProductRequestStates {}
