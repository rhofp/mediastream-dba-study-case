whenever sqlerror exit rollback
create or replace procedure spv_clean wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
194 f7
mOV4ikTpRfeetHK/+i81DbscxxQwg5By7Z4VfI5EcMEi6WFhjw6BFymJG7GrfHju6GI8Q2YG
G2bnIp2Dy8vFw7FqOst2rtw34r3bgcCGailTJElBHqZGJawRFCYNGlaUG+NNqSVwFKKlsvbA
QdWTfsr0CvqJhD6TrR6k4SuoHJ1gJeTv+ntRBYCVTZp92IwrSJo6pgC7Da+d0lGxcKQNfrhD
OXUBF+esMa+C+PlvacGM2g2LuNA=

/
show errors
create or replace procedure spv_check_tables wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
127d 6c7
+KFbHIyeJ46z1LylLwibRl4b2Tkwg+1UVcD83y+5MkHmv0BKSQtXf3wH+gK98vJtqA03QTPU
jAT3znckX3kRfaVlvorV0t+WK3NwumXUyPpZWMpwATszBXOgmJeMKu3War5ENcIZe7mZn7X1
CdJdhhoIfUd5ES50tqwCOFVzkVTNGwQx6uqmVm4PwVCSVVjeO8/ia/ajA5Yu/DK3kOX6An9B
hHxYEx0RgTrcGyGQWDgA3ZPRsAb4s3hX9YqzLGnTtpDvC3xAxoJqN4J1mpqE2afbb3bc1UnJ
61h/n4pbjHwXpixgtmW9wsRzU7h0EzDei2guxsfH4JmHBbuNHsP2rfqCwGgWVICoy+uizCnm
DjZX4wakCDLkX14X8OCOTdW7lJaQ2/j9CrqOEiF05LHT93UONtquEz2exr2x84YBiQwlFuki
VQxrx0eQRzSA9iFYresPq55ZJTCG6BMEN6ST+Ir3mszhuH1gOKuMbDrc16aU38cy0mJg+R5i
adOKC3hELOZqXySsw/A5MDirN2QenKfyxt/9nU2RU2vW/433IKRLGIymFvhzMed8fKX9NBNy
ygRYG3ZKdJsuRmDP341TsBhfXgx6hmDjjl4B4CbhkAQ7mQYhRZAZO6C2803xqbbJN+QWG7m4
jFcb0dAwS0uuJJqa4VmsPgc3gC6LqaEspS9n9P52UWyTLDwmprExbS2eiv5RONdljinDy4+K
eOdJZ1vUkeeD7OV+iOHTrAS2KUqFWekzCl/1+PmLEtnhffi6X/NU4EjvNS2bvOuojJOkcDMW
k/zvZ9DSr/RNplQjlDCZTsWllykb1s+M3nT1gO9NH+Eney2M4F76V++2KVeXFGeLqZiptEGo
csvDpF2KWAw4H8hsE8VpmSYh1mh7RL6VysTphRV/ra/87qalWaZxXbw0tV5bA8A1pCXhFzha
RFomfIWRPNB8ZeMUaa1gKdLBYdG9bWLxwd1XI/906PuHjhxnXBfcdyuGGMWBMqgkvjUxH+li
R3azPUI0mO3xlkVF3O01XRh1gf9sf6el6ehmmlXOGhYIHWmAqesMTkzcDv87C4M6mkRs7dee
l8AfUd3H1fIS0VKFtlQyeNuem9boFkkwCYwqSsz86aiTRb1ePYCh/I4V9cQiiYWbRh9w6Xkp
J7oKpdRDPXMaOixOFR/oG2dkxuV17/9TN8rMuk8VzBemwaWVVEhTxZZ6N0NmIZKwUHdYpTUh
e+qVmb4f4mbpXOXwyVCDJ/hepywgsYoPjbn75gpUZVERpcuyaO71QURE+SOvFJppcI+ngUDY
LQoeHtLYZIaxX74A7HqmlaJkh0u9VLlL3v2zJOKb0gh6gaTyTGRx/EXYd4EhGTxL6Q3eZDR/
LjLSuQKp6OobNLdytv5uWp9DFdx+krWMTvSPaMYEgt1WBbupLelBcntPgswnLFEanIx3ycwl
lkoloZkU/uqVHsKNxjcKX7EBgJ1qBi8LqyKf7tMKtgzhGOUKO3KUyEUuwqtmGU7pI7MYsc4t
Qj5kJ2HTiIsCsuimpdrgKRhaIAf1fSVrsXrZ29xstls0T0Xvc2yLQgZn/fhE95jVMF9mtcrq
1NIzFKE/YLoUvX4V6Y4UUVkJeOzy0Cj6MohH4I4bbO+SAUghRcSIO5itr436+J37G7HaJRst
9sNmGYxQ/i4V+SnvoGtcRujy4vvFlrCOclwUXPR9dbO4ZYq1pSymowr1

/
show errors
exec spv_print_header
host sha256sum &&p_script_validador
Prompt Realizando limpieza..
exec spv_clean('&&p_nombre'||'0401');
Prompt invocando script s-01-sga-components.sql
start s-01-sga-components.sql
connect sys/&&p_sys_password as sysdba
set serveroutput on
Prompt  Iniciando validación - Componentes de la SGA
Prompt =============================================
exec spv_check_tables('&&p_nombre'||'0401');
exec spv_print_ok('Validación concluida');
exit