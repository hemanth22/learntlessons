# SED ( Stream Editor)  

## Where did it come from ?  

- A *"stream editor"* written 1973 at Bell labs.  
- Command-line version of text editor *(ed)*.  
- Influenced program including awk, python and perl.  

## Where is it available ?  

- Preinstalled on most UNIX variants, include __MacOSX__.  
- Cygwin *(http://cygwin.com)* -> complete environment on windows.  
- UnxUtils *(http://unxutils.sourceforge.net)* -> individual utilities.  

## What is it good for ?  

- Simple manipulations on line oriented text files.  
- Most often used as a filter, often in shell scripts.  
- Can be used on command line.  
- Can also write complex sed programs.  

## What is it not so good for ?  

- Not useful for binary data.  
- Maybe useful if you can export to text.  

```sed
sed 's/old/new/' filename
```

- sed invokes the sed program.  
- s specifies sed's s(substitute) command.  
- old and new are the search and replace strings.  
- s command is quotedd in case it contains special chars.  

```
$ sed 's/the/THE/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched THEm up to the top of the hill
And he marched THEm down again
And when THEy were up they were up
And when THEy were down they were down
And when THEy were only half-way up
They were neiTHEr up nor down
```

```
$ sed 's/the/THE/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched THEm up to THE top of THE hill
And he marched THEm down again
And when THEy were up THEy were up
And when THEy were down THEy were down
And when THEy were only half-way up
They were neiTHEr up nor down
```

```
$ sed 's/marched/ran/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He ran them up to the top of the hill
And he ran them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

```
$ sed 's/men/women/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand women
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

```
$ sed 's/them//' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched  up to the top of the hill
And he marched  down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

```
$ sed 's/the/THE/' dukeofyork.txt array.c 
The grand old Duke of York
He had ten thousand men
He marched THEm up to the top of the hill
And he marched THEm down again
And when THEy were up they were up
And when THEy were down they were down
And when THEy were only half-way up
They were neiTHEr up nor down
/* array.c -- read, reverse, and write an array of integers */

#include <stdio.h>

#define MAX 10

void intSwap(int *x, int *y);
int getArray(int a[], int max, int terminator);
void printArray(int a[], int n);
void reverseArray(int a[], int n);

int main(void)
{
	int x[MAX];
	int howMany;

	howMany = getArray(x, MAX, -1);
	printf("Read THE following array:\n");
	printArray(x, howMany);
	reverseArray(x, howMany);
	printf("After being reversed:\n");
	printArray(x, howMany);
}

/* swap THE contents of x and y */
void intSwap(int *x, int *y)
{
	int tmp = *x;
	*x = *y;
	*y = tmp;
}

/* print THE first n elements in the array a */
void printArray(int a[], int n)
{
	int i;

	for ( i=0; i<n; i++ ) {
		printf("\t%d\n", a[i]);
	}
}

/* get up to max integers from THE user and store them in a; 
 * terminator marks end of input */
int getArray(int a[], int max, int terminator)
{
	int n = 0;
	int tmp;

	do {
		printf("Enter integer [%d to terminate] : ", terminator);
		scanf("%d", &tmp);
		if ( tmp==terminator ) {
			break;
		} 
		if ( n>=max ) {
			printf("Sorry, array is full\n");
			return n;
		} else { 
			a[n++] = tmp;
		}
	} while ( 1 );
	return n;
}

/* reverse THE order of the first n elements of a */
void reverseArray(int a[], int n)
{
	int i;

	for ( i=0; i<n/2; i++ ) {
		intSwap(&a[i], &a[n-i-1]);
	}
}
```

```
$ sed 's/the/THE/'
This is the time for all good men
This is THE time for all good men
```

```
$ nl dukeofyork.txt 
     1	The grand old Duke of York
     2	He had ten thousand men
     3	He marched them up to the top of the hill
     4	And he marched them down again
     5	And when they were up they were up
     6	And when they were down they were down
     7	And when they were only half-way up
     8	They were neither up nor down
```

```
$ nl dukeofyork.txt | sed 's/the/THE/'
     1	The grand old Duke of York
     2	He had ten thousand men
     3	He marched THEm up to the top of the hill
     4	And he marched THEm down again
     5	And when THEy were up they were up
     6	And when THEy were down they were down
     7	And when THEy were only half-way up
     8	They were neiTHEr up nor down
```

```
$ sed 's/the/THE/' < dukeofyork.txt > output.txt
```

```bash
$ cat output.txt 
The grand old Duke of York
He had ten thousand men
He marched THEm up to the top of the hill
And he marched THEm down again
And when THEy were up they were up
And when THEy were down they were down
And when THEy were only half-way up
They were neiTHEr up nor down
```

```
$ sed s/the/THE/ dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched THEm up to the top of the hill
And he marched THEm down again
And when THEy were up they were up
And when THEy were down they were down
And when THEy were only half-way up
They were neiTHEr up nor down
```

> Quotes are not necessary in normal cases.  
> But if you use special characters (OR) space then it is necessary to keep quotes.  

```
$ sed 's/the/some of the/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched some of them up to the top of the hill
And he marched some of them down again
And when some of they were up they were up
And when some of they were down they were down
And when some of they were only half-way up
They were neisome of ther up nor down
```

```
$ sed 's/thousand/$1000/' dukeofyork.txt 
The grand old Duke of York
He had ten $1000 men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```


```
$ sed s/thousand/$1000/ dukeofyork.txt 
The grand old Duke of York
He had ten 000 men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

```
$ sed 's/were/weren't/' dukeofyork.txt
> ^C
```
> This shows alert while typing dukeofyork and it doesn't end the statement of command.  

```
$ sed "s/were/weren't/" dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they weren't up they were up
And when they weren't down they were down
And when they weren't only half-way up
They weren't neither up nor down
```

```
$ sed "s/ten thousand men/$10000/" dukeofyork.txt 
The grand old Duke of York
He had 0000
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```
> Here ten thousand men is replaced with zeros "0000".  
> Because in code double quotes are used instead of single quote.  

```
$ sed "s/were/\"\$weren\'t\"/" dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they "$weren't" up they were up
And when they "$weren't" down they were down
And when they "$weren't" only half-way up
They "$weren't" neither up nor down
```

```
$ sed 's/were/weren\'t/' dukueofyork.txt
> ^C
```

```
$ sed s/were/weren\'t\ really/ dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they weren't really up they were up
And when they weren't really down they were down
And when they weren't really only half-way up
They weren't really neither up nor down
```


```
$ sed 's/the/THE/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched THEm up to THE top of THE hill
And he marched THEm down again
And when THEy were up THEy were up
And when THEy were down THEy were down
And when THEy were only half-way up
They were neiTHEr up nor down
```

```
$ sed 's/aba/_b_/g'
abababababa
_b_b_b_b_b_
^C
```

```
$ sed 's/aa/a_a/g'
aaaaaaaaaaa
a_aa_aa_aa_aa_aa
^C
```

```
$ sed 's/they/and they/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when and they were up they were up
And when and they were down they were down
And when and they were only half-way up
They were neither up nor down
```

```
$ sed 's/the/THE/2' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to THE top of the hill
And he marched them down again
And when they were up THEy were up
And when they were down THEy were down
And when they were only half-way up
They were neither up nor down
```

```
$ sed 's/a/-/40'
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
^C
```


```
$ sed 's;the;THE;g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched THEm up to THE top of THE hill
And he marched THEm down again
And when THEy were up THEy were up
And when THEy were down THEy were down
And when THEy were only half-way up
They were neiTHEr up nor down
```
> It is not necessary to have slash, even any special character can be used.  
> But for three times then only it is valid.  

```
$ sed 's;half;1/2;' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only 1/2-way up
They were neither up nor down
```

```
$ sed 's/half/1/2/' dukeofyork.txt
sed: -e expression #1, char 11: unknown option to `s'
```

```
$ sed 's/half/1\/2/' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only 1/2-way up
They were neither up nor down
```

### Regular Expressions  

A regular expression defines a pattern.  

- `/abc/` matches `"abc"`  
- `/abc/` doesnotmatch `"abxc"`  
- `/abc/` doesnotmatch `"ab"` 
- `/abc/` doesnotmatch `"ABC"` 

```
$ sed 's/the/THE/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched THEm up to the top of the hill
And he marched THEm down again
And when THEy were up they were up
And when THEy were down they were down
And when THEy were only half-way up
They were neiTHEr up nor down
```

**Matches any single character(Meta character)**  

- `/a.c/` matches `"abc"`  
- `/a.c/` matches `"axc"`  
- `/a.c/` doesnot match `"ac"`  
- `/a.c/` doesnot match `"axxc"`  

```
$ sed 's/he./HEX/g' dukeofyork.txt 
THEXgrand old Duke of York
He had ten thousand men
He marcHEX tHEX up to tHEXtop of tHEXhill
And HEXmarcHEX tHEX down again
And wHEX tHEX were up tHEX were up
And wHEX tHEX were down tHEX were down
And wHEX tHEX were only half-way up
THEX were neitHEX up nor down
```

**^ and $ match line begin and end**  

- `/^abc/` matches first 3 characters in the line `"abcd"`  
- `/^abc/` doesnot match anything in the line `"dabc"`  
- `/abc$/` doesnot match anything in the line `"abcd"`  
- `/abc$/` doesnot last 3 characters in the line `"dabc"`  

```
$ sed 's/down/FRED/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them FRED again
And when they were up they were up
And when they were FRED they were FRED
And when they were only half-way up
They were neither up nor FRED
```
```
$ sed 's/down$/FRED/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were FRED
And when they were only half-way up
They were neither up nor FRED
```

**Using character classes and quantifiers**  

`[]` matches any character in set  

- `/a[xyz]c/` matches `"axc"`  
- `/a[xyz]c/` doesnot match `"axyzc"`  

```
$ sed 's/the[my]/YOU/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched YOU up to the top of the hill
And he marched YOU down again
And when YOU were up YOU were up
And when YOU were down YOU were down
And when YOU were only half-way up
They were neither up nor down
```


```
$ sed 's/[Tt]he[my]/YOU/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched YOU up to the top of the hill
And he marched YOU down again
And when YOU were up YOU were up
And when YOU were down YOU were down
And when YOU were only half-way up
YOU were neither up nor down
```

`[]` matches any character in set

- `/a[a-z]c/` matches `"abc"`  
- `/a[a-zA-Z]c/` matches `"abc"`or `"aBC"`  

```
$ sed 's/[A-Z][a-z][a-z]/FROG/g' dukeofyork.txt 
FROG grand old FROGe of FROGk
He had ten thousand men
He marched them up to the top of the hill
FROG he marched them down again
FROG when they were up they were up
FROG when they were down they were down
FROG when they were only half-way up
FROGy were neither up nor down
```

```
$ sed 's/[a-zA-Z]/*/' dukeofyork.txt 
*he grand old Duke of York
*e had ten thousand men
*e marched them up to the top of the hill
*nd he marched them down again
*nd when they were up they were up
*nd when they were down they were down
*nd when they were only half-way up
```


```
$ sed 's/[a-lrxz]/-/' dukeofyork.txt 
T-e grand old Duke of York
H- had ten thousand men
H- marched them up to the top of the hill
An- he marched them down again
An- when they were up they were up
An- when they were down they were down
An- when they were only half-way up
T-ey were neither up nor down
```

```
$ sed 's/[a-lrxz]/-/g' dukeofyork.txt 
T-- ---n- o-- Du-- o- Yo--
H- --- t-n t-ous-n- m-n
H- m------ t--m up to t-- top o- t-- ----
An- -- m------ t--m -own ----n
An- w--n t--y w--- up t--y w--- up
An- w--n t--y w--- -own t--y w--- -own
An- w--n t--y w--- on-y -----w-y up
T--y w--- n--t--- up no- -own
```

`[]` matches any character in set  

- `/a[^a-z]c/` doesnot match `"abc"`  

```
$ sed 's/the[^]/YOU/g' dukeofyork.txt 
sed: -e expression #1, char 14: unterminated `s' command
```

```
$ sed -e 's/the[^]/YOU/g' dukeofyork.txt 
sed: -e expression #1, char 14: unterminated `s' command
```

`*` matches zero or more repeats  

- `/ab*c/` matches `"abc"`  
- `/ab*c/` matches `"abbbbbc"`  
- `/ab*c/` matches `"ac"`  
- `/ab*c/` doesnot match `"axc"` 

```
$ sed 's/t.*/zoo/g' dukeofyork.txt 
The grand old Duke of York
He had zoo
He marched zoo
And he marched zoo
And when zoo
And when zoo
And when zoo
They were neizoo
```


```
$ sed 's/t[a-z]*/zoo/g' dukeofyork.txt 
The grand old Duke of York
He had zoo zoo men
He marched zoo up zoo zoo zoo of zoo hill
And he marched zoo down again
And when zoo were up zoo were up
And when zoo were down zoo were down
And when zoo were only half-way up
They were neizoo up nor down
```

```
$ sed 's/t[a-z][a-z][a-z]*/zoo/g' dukeofyork.txt 
The grand old Duke of York
He had zoo zoo men
He marched zoo up to zoo zoo of zoo hill
And he marched zoo down again
And when zoo were up zoo were up
And when zoo were down zoo were down
And when zoo were only half-way up
They were neizoo up nor down
```

`()` Repeats multiple items  

- `/ab*c/` matches `"abbbbbc"`  
- `/(ab)*c/` matches `"abababababc"`  

**Greediness**

- `/<.*>/` matches all of `"<i>italic text</i>"`  

```
$ sed 's/<.*>/HTML/'
<i>italic text</i>
HTML
^C
```

- `/<[^>]*>/` matches only `"<i>italic text</i>"`  

```
$ sed 's/<[^>]*>/HTML/g'
<i>italic text</i>
HTMLitalic textHTML
^C
```

**Special Replacement strings**  

- `&` is replaced with found text.  

```
$ sed 's/the/(&)/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched (the)m up to (the) top of (the) hill
And he marched (the)m down again
And when (the)y were up (the)y were up
And when (the)y were down (the)y were down
And when (the)y were only half-way up
They were nei(the)r up nor down
```

```
$ sed 's/[A-Z][a-z]*/(&)/g' dukeofyork.txt 
(The) grand old (Duke) of (York)
(He) had ten thousand men
(He) marched them up to the top of the hill
(And) he marched them down again
(And) when they were up they were up
(And) when they were down they were down
(And) when they were only half-way up
(They) were neither up nor down
```


**Other special replacement strings**  

- `\n` is replaced with text found for the nth `\(...\)`  


```
$ sed 's/\(they\) \(were\)/\2 \1/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when were they up were they up
And when were they down were they down
And when were they only half-way up
They were neither up nor down
```

```
$ sed 's/they were/were they/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when were they up were they up
And when were they down were they down
And when were they only half-way up
They were neither up nor down
```


```
$ sed 's/\([Tt]hey\) \(were\)/\2 \1/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when were they up were they up
And when were they down were they down
And when were they only half-way up
were They neither up nor down
```


```
$ sed 's/were \([a-z]*\)/\1ed/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they uped they uped
And when they downed they downed
And when they onlyed half-way up
They neithered up nor down
```


```
$ sed 's/were\([a-z]*\)/\1ed/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they ed up they ed up
And when they ed down they ed down
And when they ed only half-way up
They ed neither up nor down
```


### SED Command line flags (Controllig printing with n & p modifiers)  

- `-n` suppress default print of each line.  
- `-e` allow specifying multiple commands.  
- `-f` specifies a file of command.  

```
$ sed 's/the/THE/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched THEm up to the top of the hill
And he marched THEm down again
And when THEy were up they were up
And when THEy were down they were down
And when THEy were only half-way up
They were neiTHEr up nor down
```

```
$ sed -n 's/the/THE/' dukeofyork.txt 
```


```
$ sed -n 's/the/THE/p' dukeofyork.txt 
He marched THEm up to the top of the hill
And he marched THEm down again
And when THEy were up they were up
And when THEy were down they were down
And when THEy were only half-way up
They were neiTHEr up nor down
```

> -n prevent anything being printing unless it is provided with P modifier.  

```
$ sed -n 's/the/THE/pg' dukeofyork.txt 
He marched THEm up to THE top of THE hill
And he marched THEm down again
And when THEy were up THEy were up
And when THEy were down THEy were down
And when THEy were only half-way up
They were neiTHEr up nor down
```


```
$ sed -n 's/the/THE/gp' dukeofyork.txt 
He marched THEm up to THE top of THE hill
And he marched THEm down again
And when THEy were up THEy were up
And when THEy were down THEy were down
And when THEy were only half-way up
They were neiTHEr up nor down
```

### Specifying multiple commands with e and f

```
$ sed 's/up/UP/' 's/down/DOWN/' dukeofyork.txt 
sed: can't read s/down/DOWN/: No such file or directory
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them down again
And when they were UP they were up
And when they were down they were down
And when they were only half-way UP
They were neither UP nor down
```


```
$ sed -e 's/up/UP/' -e 's/down/DOWN/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them DOWN again
And when they were UP they were up
And when they were DOWN they were down
And when they were only half-way UP
They were neither UP nor DOWN
```


```
$ sed -e 's/the/THE/g' -e 's/them/HIM/g' -e 's/they were/HE WAS/g'  dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched THEm up to THE top of THE hill
And he marched THEm down again
And when THEy were up THEy were up
And when THEy were down THEy were down
And when THEy were only half-way up
They were neiTHEr up nor down
```

```
$ sed -e 's/them/HIM/g' -e 's/they were/HE WAS/g' -e 's/the/THE/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched HIM up to THE top of the hill
And he marched HIM down again
And when HE WAS up HE WAS up
And when HE WAS down HE WAS down
And when HE WAS only half-way up
They were neiTHEr up nor down
```

```
$ sed '-es/up/UP/' '-es/down/DOWN/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them DOWN again
And when they were UP they were up
And when they were DOWN they were down
And when they were only half-way UP
They were neither UP nor DOWN
```


```
$ sed 's/up/UP/g;s/down/DOWN/g' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them DOWN again
And when they were UP they were UP
And when they were DOWN they were DOWN
And when they were only half-way UP
They were neither UP nor DOWN
```

```
$ cat sedscript
s/up/UP/g
s/down/DOWN/g
```

```
$ sed -f sedscript dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them DOWN again
And when they were UP they were UP
And when they were DOWN they were DOWN
And when they were only half-way UP
They were neither UP nor DOWN
```

**Challenge**

```
$ cat challengesedone 
s/ten thousand/one/
s/men/women/g
s/them/her/g
s/they/she/g
s/They/She/g
```

```
$ sed -f challengesedone dukeofyork.txt 
The grand old Duke of York
He had one women
He marched her up to the top of the hill
And he marched her down again
And when she were up she were up
And when she were down she were down
And when she were only half-way up
She were neither up nor down
```

### Understanding addresses and addresses ranges  

Address can precede command.  

- line number specifies line.  
- `$` specifies end of line.  
- `/.../` specifies line matching regular expression.  
- `,` specifies range of addresses(most commands).  
- `!` specifies all lines not matching addresses.  

> To change line number 3 from lower lane to upper below command.  

```
$ sed '3s/up/UP/' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

__More sed commands__

- `p` prints the specified line(s).  
- `d` deletes the specified line(s).  
- `r` reads a file at the specified line.  
- `w` writes the specified line(s).  
- `y` transforms characters ( like the `tr` command ).  

__Printing lines with P__  

```
$ sed -p dukeofyork.txt
```
> This prints lines double times from text file.  

```
$ sed -n p dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```
> Now this commands print line wise by one time.  

```
$ sed -n 3p dukeofyork.txt
He marched them up to the top of the hill
```

```
$ sed -n '$p' dukeofyork.txt
```
> This prints last line even though we don't know line number of text file.  
> Quotes should be used mandatory while using anything before p  


```
$ sed -n '1p' dukeofyork.txt 
The grand old Duke of York
```

```
$ sed -n '2,4p' dukeofyork.txt 
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
```

```
$ sed -n '1,3p' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
```

```
$ sed -n '8,9p' dukeofyork.txt array.c 
They were neither up nor down
/* array.c -- read, reverse, and write an array of integers */
```

```
$ sed -n '$p' dukeofyork.txt array.c 
}
```
> This will not print the last line of each line, but it concatenates both the file and then display last line.  


```
$ sed -n '/down/p' dukeofyork.txt 
And he marched them down again
And when they were down they were down
They were neither up nor down
```


```
$ sed -n '/[Tt]he[my]/p' dukeofyork.txt 
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

```
$ sed -n '/and\/or/p' dukeofyork.txt 
```


```
$ nl dukeofyork.txt 
     1	The grand old Duke of York
     2	He had ten thousand men
     3	He marched them up to the top of the hill
     4	And he marched them down again
     5	And when they were up they were up
     6	And when they were down they were down
     7	And when they were only half-way up
     8	They were neither up nor down
```

```
$ nl dukeofyork.txt | sed -n '/marched/,/when/p'
     3	He marched them up to the top of the hill
     4	And he marched them down again
     5	And when they were up they were up
```


```
$ nl dukeofyork.txt | sed -n '/when/,/marched/p'
     5	And when they were up they were up
     6	And when they were down they were down
     7	And when they were only half-way up
     8	They were neither up nor down
```
> Above two codes find the search pattern then it prints the matched pattern word line to till the end of file or doc.  


```
$ nl dukeofyork.txt | sed -n '/hill/,/up/p'
     3	He marched them up to the top of the hill
     4	And he marched them down again
     5	And when they were up they were up
```


```
$ nl dukeofyork.txt | sed -n '/g/,/h/p'
     1	The grand old Duke of York
     2	He had ten thousand men
     4	And he marched them down again
     5	And when they were up they were up
```
> This prints the line from where alphabet g starts & h ends in the file & display till the end of file.  


```
$ sed -n '/^}/,/^{/p' array.c 
}

/* swap the contents of x and y */
void intSwap(int *x, int *y)
{
}

/* print the first n elements in the array a */
void printArray(int a[], int n)
{
}

/* get up to max integers from the user and store them in a; 
 * terminator marks end of input */
int getArray(int a[], int max, int terminator)
{
}

/* reverse the order of the first n elements of a */
void reverseArray(int a[], int n)
{
}
```
> This prints c file which from closing brance to opening brace it skip the function or other.  
> But it display command line & function names.  


```
$ nl dukeofyork.txt | sed -n '2,/down/p'
     2	He had ten thousand men
     3	He marched them up to the top of the hill
     4	And he marched them down again
```



```
$ nl dukeofyork.txt | sed -n '/when/,$p'
     5	And when they were up they were up
     6	And when they were down they were down
     7	And when they were only half-way up
     8	They were neither up nor down
```


```
$ nl dukeofyork.txt | sed -n '2,5p'
     2	He had ten thousand men
     3	He marched them up to the top of the hill
     4	And he marched them down again
     5	And when they were up they were up
```


```
$ nl dukeofyork.txt | sed -n '2,5!p'
     1	The grand old Duke of York
     6	And when they were down they were down
     7	And when they were only half-way up
     8	They were neither up nor down
```
> This prints other than 2 to 5 lines.  


```
$ sed -n '/down/!p' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And when they were up they were up
And when they were only half-way up
```
> This doesn't prints lines which contain down.  

__Deleting line with d__

```
$ nl dukeofyork.txt | sed '4d'
     1	The grand old Duke of York
     2	He had ten thousand men
     3	He marched them up to the top of the hill
     5	And when they were up they were up
     6	And when they were down they were down
     7	And when they were only half-way up
     8	They were neither up nor down
```
> This will delete the line 4 in the output not in the file.  

```
$ nl dukeofyork.txt | sed '/up/d'
     1	The grand old Duke of York
     2	He had ten thousand men
     4	And he marched them down again
     6	And when they were down they were down
```
> This will prints the line excludes line which has up word.  

```
$ nl dukeofyork.txt | sed '/thousand/,/down/d'
     1	The grand old Duke of York
     5	And when they were up they were up
     6	And when they were down they were down
     7	And when they were only half-way up
     8	They were neither up nor down
```
> This command deletes first occurence of thousand to subsequent occurence of down.  


```
$ nl dukeofyork.txt | sed '/up/!d'
     3	He marched them up to the top of the hill
     5	And when they were up they were up
     7	And when they were only half-way up
     8	They were neither up nor down
```
> This command delete only lines which doen't contain word up.  


```
$ nl dukeofyork.txt | sed '2,4!d'
     2	He had ten thousand men
     3	He marched them up to the top of the hill
     4	And he marched them down again
```
> This command delete everything except 2,3,4 lines.  


```
$ sed '1,7d' dukeofyork.txt 
They were neither up nor down
```

__Readiing & writing files with r & w__  


```
$ cat haha 
==> HAHA HE SAID "DOWN"
```

`$ chmod 777 haha`

```
$ sed '/down/r haha' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
==> HAHA HE SAID "DOWN"
And when they were up they were up
And when they were down they were down
==> HAHA HE SAID "DOWN"
And when they were only half-way up
They were neither up nor down
==> HAHA HE SAID "DOWN"
```
> Above command checks the line which contain word down then it adds the line from haha file space between r and filename is optional.  
> But in case newer version of sed, it is necessary to use atmost one space between r and filename.  

```
$ sed '/down/w top' dukeofyork.txt 
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```
> This command searches for line which contains down and writes it top named file.  

```
$ cat top 
And he marched them down again
And when they were down they were down
They were neither up nor down
```


```
$ sed '1,3wtop' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```


```
$ sed -n '/down/w down' dukeofyork.txt
```
> Above command will suppress the printing of line in terminal, but writes sliently to file down.  

```
$ cat down 
And he marched them down again
And when they were down they were down
They were neither up nor down
```


```
$ sed 's/up/UP/w up' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them down again
And when they were UP they were up
And when they were down they were down
And when they were only half-way UP
They were neither UP nor down
```



```
$ sed 's/up/UP/gw up' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them down again
And when they were UP they were UP
And when they were down they were down
And when they were only half-way UP
They were neither UP nor down
```
> This command globa data to output file.  

```
$ sed 's/up/UP/wg up' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them down again
And when they were UP they were up
And when they were down they were down
And when they were only half-way UP
They were neither UP nor down
```
> This doesn't print globally changed value instead of that it replace one line put in to filename "g up".  


```
$ cat g\ up 
He marched them UP to the top of the hill
And when they were UP they were up
And when they were only half-way UP
They were neither UP nor down
```


```
$ sed -e '/down/w down' -e 's/up/UP/' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them down again
And when they were UP they were up
And when they were down they were down
And when they were only half-way UP
They were neither UP nor down
```

```
$ cat down 
And he marched them down again
And when they were down they were down
They were neither up nor down
```


```
$ sed -e 's/up/UP/' -e '/down/w down' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them down again
And when they were UP they were up
And when they were down they were down
And when they were only half-way UP
They were neither UP nor down
```


```
$ cat down 
And he marched them down again
And when they were down they were down
They were neither UP nor down
```


```
$ sed -e 's/up/UP/w out' -e 's/down/DOWN/w out' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them DOWN again
And when they were UP they were up
And when they were DOWN they were down
And when they were only half-way UP
They were neither UP nor DOWN
```


```
$ cat out
He marched them UP to the top of the hill
And he marched them DOWN again
And when they were UP they were up
And when they were DOWN they were down
And when they were only half-way UP
They were neither UP nor down
They were neither UP nor DOWN
```

__Performing transformation with y__  

```
$ sed 'y/abcdef/ABCDEF/' dukeofyork.txt
ThE grAnD olD DukE oF York
HE hAD tEn thousAnD mEn
HE mArChED thEm up to thE top oF thE hill
AnD hE mArChED thEm Down AgAin
AnD whEn thEy wErE up thEy wErE up
AnD whEn thEy wErE Down thEy wErE Down
AnD whEn thEy wErE only hAlF-wAy up
ThEy wErE nEithEr up nor Down
```


```
$ sed 'y/aceilost/4(3!10$+/' dukeofyork.txt
Th3 gr4nd 01d Duk3 0f Y0rk
H3 h4d +3n +h0u$4nd m3n
H3 m4r(h3d +h3m up +0 +h3 +0p 0f +h3 h!11
And h3 m4r(h3d +h3m d0wn 4g4!n
And wh3n +h3y w3r3 up +h3y w3r3 up
And wh3n +h3y w3r3 d0wn +h3y w3r3 d0wn
And wh3n +h3y w3r3 0n1y h41f-w4y up
Th3y w3r3 n3!+h3r up n0r d0wn
```


```
$ sed 'y/a-z/A-Z/' dukeofyork.txt
The grAnd old Duke of York
He hAd ten thousAnd men
He mArched them up to the top of the hill
And he mArched them down AgAin
And when they were up they were up
And when they were down they were down
And when they were only hAlf-wAy up
They were neither up nor down
```



```
$ sed 'y/acd/\n\/\\/' dukeofyork.txt
The gr
n\ ol\ Duke of York
He h
\ ten thous
n\ men
He m
r/he\ them up to the top of the hill
An\ he m
r/he\ them \own 
g
in
An\ when they were up they were up
An\ when they were \own they were \own
An\ when they were only h
lf-w
y up
They were neither up nor \own
```


__Appending, inserting, and changing entire lines with a,i, and c.__  

- a appends lines  
- i inserts lines  
- c changes lines


```
$ sed '/down/a\
> ==> HAHA HE SAID "DOWN"
> ' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
==> HAHA HE SAID "DOWN"
And when they were up they were up
And when they were down they were down
==> HAHA HE SAID "DOWN"
And when they were only half-way up
They were neither up nor down
==> HAHA HE SAID "DOWN"
```



```
$ sed '/down/a\ ==> HAHA HE SAID "DOWN"' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
 ==> HAHA HE SAID "DOWN"
And when they were up they were up
And when they were down they were down
 ==> HAHA HE SAID "DOWN"
And when they were only half-way up
They were neither up nor down
 ==> HAHA HE SAID "DOWN"
```



```
$ sed '/down/a\
> ==> HAHA \
> ==> HE SAID "DOWN"
> ' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
==> HAHA 
==> HE SAID "DOWN"
And when they were up they were up
And when they were down they were down
==> HAHA 
==> HE SAID "DOWN"
And when they were only half-way up
They were neither up nor down
==> HAHA 
==> HE SAID "DOWN"
```







```
$ sed 'a\
> \
> ' dukeofyork.txt
The grand old Duke of York


He had ten thousand men


He marched them up to the top of the hill


And he marched them down again


And when they were up they were up


And when they were down they were down


And when they were only half-way up


They were neither up nor down



```




```
$ sed '/down/a\
> HAHA HE SAID "DOWN"
> ' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
HAHA HE SAID "DOWN"
And when they were up they were up
And when they were down they were down
HAHA HE SAID "DOWN"
And when they were only half-way up
They were neither up nor down
HAHA HE SAID "DOWN"
```


```
$ sed '/down/a\
> \   HAHA HE SAID "DOWN"
> ' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
   HAHA HE SAID "DOWN"
And when they were up they were up
And when they were down they were down
   HAHA HE SAID "DOWN"
And when they were only half-way up
They were neither up nor down
   HAHA HE SAID "DOWN"
```



```
$ cat script 
/down/ a\
==> HAHA HE SAID DOWN
/up/ a\
==> HAHA HE SAID UP
```

```
$ sed -f script dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
==> HAHA HE SAID UP
And he marched them down again
==> HAHA HE SAID DOWN
And when they were up they were up
==> HAHA HE SAID UP
And when they were down they were down
==> HAHA HE SAID DOWN
And when they were only half-way up
==> HAHA HE SAID UP
They were neither up nor down
==> HAHA HE SAID DOWN
==> HAHA HE SAID UP
```


```
$ cat scriptone 
/again/ i\
==> HE'S ABOUT TO SY "AGAIN"
/again/ a\
==> HE SAID "AGAIN"
```

```
$ sed -f scriptone dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
==> HE'S ABOUT TO SY "AGAIN"
And he marched them down again
==> HE SAID "AGAIN"
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```




```
$ sed '/top/,/again/ c\
> He treated them inconsistently \
> And their moods were variable 
> ' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He treated them inconsistently 
And their moods were variable 
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down

```


```
$ sed -n '/main/,/^}/w main.c' array.c 
```


```
$ cat main.c 
int main(void)
{
	int x[MAX];
	int howMany;

	howMany = getArray(x, MAX, -1);
	printf("Read the following array:\n");
	printArray(x, howMany);
	reverseArray(x, howMany);
	printf("After being reversed:\n");
	printArray(x, howMany);
}
```


```
$ cat array.c 
/* array.c -- read, reverse, and write an array of integers */

#include <stdio.h>

#define MAX 10

void intSwap(int *x, int *y);
int getArray(int a[], int max, int terminator);
void printArray(int a[], int n);
void reverseArray(int a[], int n);

int main(void)
{
	int x[MAX];
	int howMany;

	howMany = getArray(x, MAX, -1);
	printf("Read the following array:\n");
	printArray(x, howMany);
	reverseArray(x, howMany);
	printf("After being reversed:\n");
	printArray(x, howMany);
}

/* swap the contents of x and y */
void intSwap(int *x, int *y)
{
	int tmp = *x;
	*x = *y;
	*y = tmp;
}

/* print the first n elements in the array a */
void printArray(int a[], int n)
{
	int i;

	for ( i=0; i<n; i++ ) {
		printf("\t%d\n", a[i]);
	}
}

/* get up to max integers from the user and store them in a; 
 * terminator marks end of input */
int getArray(int a[], int max, int terminator)
{
	int n = 0;
	int tmp;

	do {
		printf("Enter integer [%d to terminate] : ", terminator);
		scanf("%d", &tmp);
		if ( tmp==terminator ) {
			break;
		} 
		if ( n>=max ) {
			printf("Sorry, array is full\n");
			return n;
		} else { 
			a[n++] = tmp;
		}
	} while ( 1 );
	return n;
}

/* reverse the order of the first n elements of a */
void reverseArray(int a[], int n)
{
	int i;

	for ( i=0; i<n/2; i++ ) {
		intSwap(&a[i], &a[n-i-1]);
	}
}
```


```
$ sed -n '/^[a-z]* main *(/,/^}/w main.c' array.c
```


```
$ cat main.c 
int main(void)
{
	int x[MAX];
	int howMany;

	howMany = getArray(x, MAX, -1);
	printf("Read the following array:\n");
	printArray(x, howMany);
	reverseArray(x, howMany);
	printf("After being reversed:\n");
	printArray(x, howMany);
}
```


__Grouping commands with and___  

__Writing programs in sed__  

- `{...}` groups commands into blocks.  
- `n` gets the nextline.  
- `q` exits the program.  
- `#` introduces a comment.  
- `=` and `l` are used for debugging.  


```
$ sed -e 's/up/UP/g' -e 's/down/DOWN/g' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them DOWN again
And when they were UP they were UP
And when they were DOWN they were DOWN
And when they were only half-way UP
They were neither UP nor DOWN
```


```
$ cat scripttwo 
s/up/UP/g
s/down/DOWN/g
```


```
$ sed -f scripttwo dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them DOWN again
And when they were UP they were UP
And when they were DOWN they were DOWN
And when they were only half-way UP
They were neither UP nor DOWN
```


```
$ cat scriptthree 
/when/ s/up/UP/g
/when/ s/down/DOWN/g
```


```
$ sed -f scriptthree dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were UP they were UP
And when they were DOWN they were DOWN
And when they were only half-way UP
They were neither up nor down
```


```
$ cat scriptfour 
/when/{
   s/up/UP/g
   s/down/DOWN/g
}
```



```
$ sed -f scriptfour dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were UP they were UP
And when they were DOWN they were DOWN
And when they were only half-way UP
They were neither up nor down
```


```
$ cat scriptfive 
/when/ !{
    s/up/UP/g
    s/down/DOWN/g
}
```


```
[bhemanth@localhost Exercise Files]$ sed -f scriptfive dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them UP to the top of the hill
And he marched them DOWN again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither UP nor DOWN

```

```
$ cat > scriptsix
3,6{
   /when/{
       s/up/UP/g
       s/down/down/g
  }
}
```


```
$ sed -f scriptsix dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were UP they were UP
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```


```
$ nl dukeofyork.txt | sed -f scriptsix 
     1	The grand old Duke of York
     2	He had ten thousand men
     3	He marched them up to the top of the hill
     4	And he marched them down again
     5	And when they were UP they were UP
     6	And when they were down they were down
     7	And when they were only half-way up
     8	They were neither up nor down
```

__Getting the next line with n__  

```
$ cat scriptn
/marched/{
    n
    s/^/((/
    n
    s/$/))/
}
```


```
$ sed -f scriptn dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
((And he marched them down again
And when they were up they were up))
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

__Existing with q and d__  

```
$ sed '/again/q' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
```


```
$ sed -n '1,/again/p' dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
```

```
$ cat scriptnq
/marched/{
    n
    s/^/((/
    n
    s/$/))/
    q
}
```

```
$ sed -f scriptnq dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
((And he marched them down again
And when they were up they were up))
```


```
$ cat scripter 
/up/{
  s/up/UP/
  d
  s/^/==/
}
```


```
$ sed -f scripter dukeofyork.txt
The grand old Duke of York
He had ten thousand men
And he marched them down again
And when they were down they were down
```

__Commenting with debugging with I__  

```
$ cat scripters
# Put double parenthesis around first two lines after "marched"
/marched/{
    n
    s/^/((/
    n
    s/$/))/
}
```

```
$ sed -f scripters dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
((And he marched them down again
And when they were up they were up))
And when they were down they were down
And when they were only half-way up
They were neither up nor down

```

```
$ cat !$
cat debugscripters
# Put double parenthesis around first two lines after "marched"
/marched/{
    n
    =
    s/^/((/
    n
    =
    s/$/))/
    =
}
```


```
$ sed -f debugscripters dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
4
((And he marched them down again
5
5
And when they were up they were up))
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```


```
$ cat scriptlone
s/ / /3
```


```
$ sed -f scriptlone dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

```
$ cat scriptlones
s/ / /3
l
```


```
$ sed -f scriptlones dukeofyork.txt
The grand old Duke of York$
The grand old Duke of York
He had ten thousand men$
He had ten thousand men
He marched them up to the top of the hill$
He marched them up to the top of the hill
And he marched them down again$
And he marched them down again
And when they were up they were up$
And when they were up they were up
And when they were down they were down$
And when they were down they were down
And when they were only half-way up$
And when they were only half-way up
They were neither up nor down$
They were neither up nor down
```


## Managing multiline pattern space with N,D, and P.

- N appends a newline and reads in the next input line.  
- P prints upto the first newline.  
- D deletes upto and including the first newline.  
- like d,D stops processing, but doesn't get the nextline unless it leaves the pattern space empty.  

__How sed works__  

- Read line from input into pattern space.  
- Examine all commands in script to see which apply.  
- Execute applicable commands in order.  
- Print pattern space(unless -n is in effect).  

```
$ cat scriptsed 
/marched/ {
    n
    s/^/((/
    n
    s/$/))/
}
```


```
$ sed -f scriptsed dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
((And he marched them down again
And when they were up they were up))
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

```
$ cat > scriptsedone
/marched/{
     N
     s/\n/-/
}
```


```
$ sed -f scriptsedone dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill-And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

```
$ cat script7
N
s/marched.*up/marched...up/
```


```
$ sed -f script7 dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched...up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```


```
$ cat script71
N
s/marched.*up/marched...up/
P
D
```


```
$ sed -f script71 dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched...up to the top of the hill
And he marched...up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

### Flow control with b, and t

- `:` defines a label  
- `b` branches to a label  
- `t` branches only if any substitutes have occured  

```
$ cat script72 
s/the/THE/g
b next
s/up/UP/g
:next
s/down/DOWN/g
b
s/marched/MARCHED/g
```


```
$ sed -f script72 dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched THEm up to THE top of THE hill
And he marched THEm DOWN again
And when THEy were up THEy were up
And when THEy were DOWN THEy were DOWN
And when THEy were only half-way up
They were neiTHEr up nor DOWN
```


```
$ cat !$
cat script73
s/again/again/
t label
s/the/THE/g
: label
s/up/UP/g
```


```
$ sed -f script73 dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched THEm UP to THE top of THE hill
And he marched them down again
And when THEy were UP THEy were UP
And when THEy were down THEy were down
And when THEy were only half-way UP
They were neiTHEr UP nor down
```

### Managing the hold biffer with g,G,h,H and X

Managing the hold buffer

- h copies pattern space into the hold buffer.  
- g copies the hold buffer into pattern space.  
- H appends newline + hold buffer to pattern space.  
- G appends newline + pattern space to the hold buffer.  
- x exchanges pattern space and hold buffer.  
- p print up to the first embedded newline of the current pattern space.  

```
$ cat script74
2 {
h
}
$ {
p
g
}
```

```
$ sed -f script74 dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
He had ten thousand men
```

```
$ cat dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
```

```
$ cat script75
2 {
h
H
}
$ {
G
}
```

```
$ sed -f script75 dukeofyork.txt
The grand old Duke of York
He had ten thousand men
He marched them up to the top of the hill
And he marched them down again
And when they were up they were up
And when they were down they were down
And when they were only half-way up
They were neither up nor down
He had ten thousand men
He had ten thousand men
```


```
$ cat script76
: top
/_/{
x
/ON/!{
s/.*/ON/
x
s;_;<i>;
}
/ON/{
s/.*/OFF/
x
s;_;</i>;
}
b top
}
```

```
$ sed -f script76
This is a _test_ of the _script_ script
This is a <i>test</i> of the <i>script</i> script
```

```
$ cat script77
s/ /#/3
h
s/#.*$//
x/abcdefghijklmnopqrstuvwxyz/[A-Z]/
G
s/\n.*#//
```

`sed -f script77 dukeofyork.txt`

__REFERENCE__  

[SED](http://sed.sourceforge.net/)  

http://grymoire.com/unix/sed.html

[IBM 1](https://www.ibm.com/developerworks/library/l-sed1/index.html)  

[IBM 2](https://www.ibm.com/developerworks/library/l-sed2/index.html)  

[IBM 3](https://www.ibm.com/developerworks/library/l-sed3/)  

[IBM](https://www.ibm.com/support/knowledgecenter/en/ssw_aix_71/com.ibm.aix.cmds5/sed.htm)  