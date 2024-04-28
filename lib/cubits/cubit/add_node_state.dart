part of 'add_node_cubit.dart';

@immutable
sealed class AddNodeState {}

final class AddNodeInitial extends AddNodeState {}

final class AddNodeLoding extends AddNodeState {}

final class AddNodeSuccess extends AddNodeState {}

final class AddNodeFiler extends AddNodeState {
  final String errMessag;

  AddNodeFiler(this.errMessag);
}
