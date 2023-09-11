abstract class OrderStates{

}

class OrderInitialState extends OrderStates{

}

class OrderDrawerState extends OrderStates{

}



class OrderLoadingState extends OrderStates {}
class  OrderSuccessState extends OrderStates {}
class  OrderErrorState extends OrderStates {}

class  AcceptOrderLoadingState extends OrderStates {}
class  AcceptOrderSuccessState extends OrderStates {}
class  AcceptOrderErrorState extends OrderStates {}


