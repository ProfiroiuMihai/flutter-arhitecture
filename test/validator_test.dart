

import 'package:flutter_template/util/input_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("example",(){

    //setup

    //run

    //verify
  });

  test("empty email return error string",(){
    var result = InputFieldValidators.emailValidator("");
    expect(result,"Invalid email");
  });

  test("valid email return error string",(){
    var result = InputFieldValidators.emailValidator("joe.doe@gmail.com");
    expect(result,null);
  });

  test("empty title post return error string",(){
    var result = InputFieldValidators.postTitleValidator("");
    expect(result,"Title needs to be at least ${InputFieldValidators.POST_TITLE_LENGTH} characters long");
  });

}