import 'package:integration_testing/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class ControllerBloc with Validators {
  final _email = BehaviorSubject<String>();
  get email => _email.stream.transform(validateEmail);
  get changeEmail => _email.add;

  final _cpf = BehaviorSubject<String>();
  get cpf => _cpf.stream.transform(validCPF);
  get changeCPF => _cpf.add;

  get validForm => CombineLatestStream(
        <Stream>[email, cpf],
        (values) => true,
      );
}
