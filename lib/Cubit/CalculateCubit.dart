import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

import 'CubitStates.dart';

class CalculatorCubit extends Cubit<CubitSates>
{
   CalculatorCubit() : super(InitStateCubit());

   static CalculatorCubit get(context) => BlocProvider.of(context);

   var userQuestion = '' ;
   var userAnswer = '';


   UserQuestionFun(X)
   {
      userQuestion += X ;
      emit(UserQuestion());
   }
   DeleteFun()
   {
      userQuestion =  ' ' ;
      emit(DeleteFunState());
   }
    COperatorFun()
    {
     userQuestion = userQuestion.substring(0,userQuestion.length-1);
     emit(COperatorFunState());
    }

    equalPressed()
   {
     String finalQuestion = userQuestion;
     Parser P = Parser() ;
     Expression exp = P.parse(finalQuestion);
     ContextModel cm = ContextModel();
     double eval = exp.evaluate(EvaluationType.REAL, cm);
     userAnswer = eval.toString();
     emit(EqualPressedState());
   }

   AnsButtonFun()
   {
     userQuestion += userAnswer ;
     emit(AnsButtonFunState());
   }
}

