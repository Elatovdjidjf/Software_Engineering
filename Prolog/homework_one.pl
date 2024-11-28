% ���� �����
tema(fauna).
tema(flora).
tema(sport).
tema(kosmos).

% �������� ����� ���� (�������� ������� ������)
itog(Heroes) :-
    Heroes = [_, _, _, _], % 4 "��������� �������" - 4 ��������� ������
    member([volk, fauna], Heroes), % ���� ��������������� �����.
    member([nif, TemaNif], Heroes), tema(TemaNif), TemaNif \= fauna,
    member([naf, TemaNaf], Heroes), tema(TemaNaf), TemaNaf \= fauna,
    member([nuf, TemaNuf], Heroes), tema(TemaNuf), TemaNuf \= fauna,
    sleva_ot([volk, fauna], [naf, TemaNaf], Heroes), % ���� ����� �� ����
    sprava_ot([nif, TemaNif], [_, kosmos], Heroes), % ��� ������ �� ���������� �������
    naprotiv([nuf, TemaNuf], [naf, TemaNaf], Heroes), % ��� �������� ����
    TemaNuf \= sport, % ��� �� ����� �����
    all_different([fauna, TemaNif, TemaNaf, TemaNuf]).

% ������������� � ��������� �������� �� ���������� ����, ��� �������� ����� ����� �� ������� ���������
sleva_ot(Odin, Vtoroi, [Odin, Vtoroi | _]).
sleva_ot(Odin, Vtoroi, [_ | Ostatok_spiska]) :- sleva_ot(Odin, Vtoroi, Ostatok_spiska).

% ���������� � "����� ��", ������ ������ "������ ��"
sprava_ot(Odin, Vtoroi, [Vtoroi, Odin | _]).
sprava_ot(Odin, Vtoroi, [_ | Ostatok_spiska]) :- sprava_ot(Odin, Vtoroi, Ostatok_spiska).

% �������� �������� ������� ���������
naprotiv(Odin, Vtoroi, [Odin, _, Vtoroi, _]).
naprotiv(Odin, Vtoroi, [_, Odin, _, Vtoroi]).

% �������� �� ��, ��� ������ �������� ��������������� ������ �����
all_different([]).
all_different([Start|End]) :- not(member(Start, End)), all_different(End).
