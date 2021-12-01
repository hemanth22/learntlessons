# Regular Expressions

## What are regular expressions ?

- Regular Expression  
	- Symbols representing a text pattern  
- Regular Expressions  
	- Formal language interpreted by a regular expression processor  
- Used for matching searching and replacing text  
- "Regex" for short(sometimes "Regexp")  

- Usage examples  
	- Test if a phone number has the correct number of digits
	- Test if an email address is in a valid format
	- Search a document for either "color" or "colour"
	- Replace all occurences of "Bob", "Bobby", or "B" with "Robert"
	- Count the number of times "training" is immediately preceded by "computer", "video", or "online"  
	- Convert a tab-delimited file into a comma-delimited file
	- Find duplicate words in a text.

- "matches"  
	- A regular expression matches text if it correctly describes the text  
	- Text matches a regualr expression if it is correctly described by the expression


### History of Regular expressions

- 1943: Warren McCulloch and Walter Pitts develop models of how the nervous system works (i.e., how a machine could be built like a brain)  
- 1956: Stephen Kleene describes the models with an algebra called "regular sets" and creates a notation to express them call "regular expressions"  
- 1968: Ken Thompson implements regular expressions in ed, an early Unix text editor  
- `g/Regular Expression/p`  
- Global Regular Expression Print: "grep"  
- grep become stand-alone program  
- Became widely used in other Unix programs(awk, vi, emacs, et al.)  
- Popularity of Unix and grep  
- grep evolves  
- egrep: "extended grep"  
- Many programs, many programmers, many changes = many incompatibilites  
- 1986: POSIX (Portal Operating System Interface)  
  - Standard to ensure compatibility  
  - Basic Regular Expressions (BREs)  
  - Extended Regular Expressions (EREs)  
- 1986: Henry Spencer releases a regex library written in C
  - Could be incorported into other programs
  - Provided Consistency
- 1987: Larry Wall releases Perl  
  - Used Spencer's regex library
  - Over time, added many powerful features
- Perl-compatible languages and programs
  - Apache, C/C++, C#/VB/.NET,Java,JavaScript,MySQL,PHP,Python,Ruby  
  - PCRE library

## Regular Expression Engines

- C/C++  
- Java
- JavaScript/ActionScript (ECMAScript)  
- .Net  
- Perl  
- PHP (PCRE)  
- Python  
- Ruby  
- Unix (POSIX BRE, POSIX ERE)  
- Apache (v1: POSIX ERE, v2: PCRE)  
- MySQL (POSIX ERE)  

## Installing an Engine

- grep/egrep  
- TextMate/e Text Editor  
- BBEdit  
- EditPad Pro  
- PowerGREP  
- RegexBuddy  
- RegexMagic  
- C/C++, Java, .NET, Perl, PHP, Python, Ruby  
- Mobile applications  
- Online, JavaScript version  
- http://regexpal.com  
- Included with the course files  

## Notation Conventions and Modes  

- Regular expression  
  - /abc/  
  - As in: g/re/p  
  - Use without forward slashes  

- Text string
  - "abc"  
  - Use without quotes  

 - Modes:  
   - Standard: /re/  
   - Global: /re/g  
   - Case-insensitive: /re/i  
   - Multiline: /re/m  
   - Dot-matches-all: /re/s  

## Literal Characters  

- Strings  
  - /car/ matches "car"  
  - /car/ matches the first three letters of "carnival"  
  - Similar to searching in a word processor  
  - Simplest match there is  

- Case-sensitive (by default)  

- Standard (non-global) matching  
  - Earliest (leftmost) match is always preferred.  
  - /zz/ matches the first set of z's in "pizzazz"  

- Global matching  
  - All matches are found throughout the text  
  - /zz/g matches the both set of z's in "pizzazz"  

- Regular expression engines are eager  

## Meta Characters  

- Characters with special meaning  
  - Like mathematical operators  
  - Transform literal characters into powerful expressions  

- Only a few metacharacters to learn  
  - `\ . * + - {} [] ^ $ | ? () : ! =`

- Can have more than one meaning  
  - Depends on how it is used in context  

- Variation between regex engines  

## The Wildcard Meta characters  

|MetaCharacter|Meaning|
|---|---|
|`.`|Any character except newline|

- Matches any one character except newline  
  - Original Unix regex tools were line-based  
  - /h.t/ matches "hat", "hot", and "hit", but not "heat"  
- Broadest match possible  
- Most common metacharacter  
- Most common mistake  
  - /9.00/ matches "9.00", "9500", and "9-00"  

## Escaping Metacharacters

|MetaCharacter|Meaning|
|---|---|
|`\`|Escape the next character|

- Allows use of metacharacters as literal characters  
  - Match a period with \.  
    - /9\.00/ matches "9.00", but not "9500" or "9-00"  
  - Match a backslash by escaping a backslash (\\)  

- Only for metacharacters  
  - Literal characters should never be escaped, gives them meaning  

- Quotation marks are not metacharacters, do not need to be escaped.  

## Other special characters  

- Spaces
- Tabs(\t)
- Line returns (\r,\n,\r\n)
- Non-printable characters
  - bell (\a), escape (\e), form feed (\f), vertical tab (\v)
- ASCII or ANSI codes  
  - Codes that control appearance of a text terminal
  - 0xA9 = \xA9

## Defining a character set

|Metacharacter|Meaning|
|---|---|
|`[`|Begin a character set|
|`]`|End a character set|

- Any one of several characters
  - But only one character
  - Order of characters does not matter

- Examples
  - /[aeiou]/ matches any one vowel
  - /gr[ea]y/ matches "grey" and "gray"
  - /gr[ea]t/ does not match "great"

## Character Ranges

|Metacharacter|Meaning|
|---|---|
|`-`|Range of characters|

- Range metacharacter
  - Represents all characters between two characters
  - Only a metacharacter inside a character set, a literal dash otherwise  

- Examples  
  - [0-9]
  - [A-Za-z]
  - [a-ek-ou-y]

- Caution
  - [50-99] is not all numbers from 50 to 99, it is same as [0-9]

## Negative character sets

|Metacharacter|Meaning|
|---|---|
|`^`|Negate a character set|

- Not anyone of several characters
  - Add `^` as the first character inside a character set  
  - Still represents one character  

- Examples  
  - /[^aeiou]/ matches any one consonant (non-vowel)  
  - /see[^mn]/ matches "seek" and "sees", but not "seem" or "seen"  

- Caution
  - /see[^mn]/ matches "see " but not "see"

## Metacharacters inside character sets

- Metacharacters inside character sets are already escaped
  - Do not need to escape them again  
  - /h[abc.xyz]t/ matches "hat" and "h.t", but not "hot"  

- Exceptions
  - `] - ^ \`

- Examples
  - `/var[[(][0-9][\])]]/`  
  - `/2003[-/]10[-/]05/` may not require escaping  
  - `/file[0-\_]1/` does require escaping
  - `var[[(][0-9][)\]]` matches `var(3) var[4]`  
  - `file[0\-\\_]1`  

## Shorthand character sets

|Shorthand|Meaning|Equivalent|
|---|---|---|
|`\d`|Digit|`[0-9]`|
|`\w`|Word character|`[a-zA-Z0-9_]`|
|`\s`|Whitespace|`[ \t\r\n]`|
|`\D`|Not digit|`[^0-9]`|
|`\W`|Not word character|`[^a-zA-Z0-9_]`|
|`\S`|Not whitespace|`[^ \t\r\n]`|

- `\w`
  - Underscore is a word character
  - Hyphen is not a word character

- Examples
  - `/\d\d\d\d/` matches "1984", but not "text"  
  - `/\w\w\w/` matches "ABC", "123", and "1_A"  
  - `/\w\s\w\w/` matches "I am", but not "Am I"  
  - `/[\w\-]/` matches as word character or hyphen (useful)  
  - `/[\d\s]/` matches any digit or whitespace character  
  - `/[^\d]/` is the same as `/\D/` and `/[^0-9]/`  

- Cautions
  - `/[^\d\s]/` is not the same as [\D\S]  
  - `/[^\d\s]/` = NOT digit OR space character  
  - `/[\D\S]/` = EITHER NOT digit OR NOT space character  

- Support
  - Originated with Perl  
  - All modern regex engines  
  - Not in many Unix tools  

## POSIX BRACKET EXPRESSIONS

|Class|Meaning|Equivalent|
|---|---|---|
|`[:alpha:]`|Alphabetic characters|`A-Za-z`|
|`[:digit:]`|Numeric characters|`0-9`|
|`[:alnum:]`|Alphanumeric characters|`A-Za-z0-9`|
|`[:lower:]`|Lowercase alphabetic characters|`a-z`|
|`[:upper:]`|Uppercase alphabetic characters|`A-Z`|
|`[:punct:]`|Punctuation characters||
|`[:space:]`|Space characters|`\s`|
|`[:blank:]`|Blank characters (space,tab)||
|`[:print:]`|Printable characters, spaces||
|`[:graph:]`|Printable characters, no spaces||
|`[:cntrl:]`|Control characters(non-printable)||
|`[:xdigit:]`|Hexadecimal characters|`A-Fa-f0-9`|

- Use inside a character class, not standalone  
  - Correct: `[[:alpha:]]` or `[^[:alpha:]]`  
  - Incorrect: `[:alpha:]`  

- Good idea not to mix POSIX sets and other shorthand sets  
- Support  
  - Yes: Perl, PHP, Ruby, Unix  
  - No: Java, JavaScript, .NET, Python  

__Command:__ `ps aux | grep --regex="s[[:digit:]]"`  

__Command:__ `ps aux | grep --regex="s[:digit:]"`  

## Repetition Metacharacters

|Metacharacter|Meaning|
|---|---|
|`*`|Preceding item zero or more times|
|`+`|Preceding item one or more times|
|`?`|Preceding item zero or one times|

- Examples
  - `/apples*/` matches "apple","apples", and "applesssss"
  - `/apples+/` matches "apples" and "applesssss", but not "apple"  
  - `/apples?/` matches "apple" and "apples", but not "applesssss"  
  - `/\d\d\d\d*/` matches numbers with three digits or more  
  - `/\d\d\d+/` matches numbers with three digits or more  
  - `/colou?r/` matches "color" and "colour"  

- Support  
  - `*` is supported in all regex engines
  - `+` and `?` are not supported in BREs (i.e., old Unix programs)  

## Quantified Repetition

|Metacharacter|Meaning|
|---|---|
|`{`|Start quantified repetition of preceding item|
|`}`|End quantified repetition of preceding item|

syntax: `{min,max}`  

- min and max are positive numbers  
- min must always be included, can be zero  
- max is optional  

- Three syntaxes  
  - `\d{4,8}` matches numbers with four to eight digits
  - `\d{4}` matches numbers with exactly four digits (min is max)  
  - `\d{4,}` matches numbers with four or more digits (max is infinite)  

- Examples  
  - `\d{0,}` is the same as `\d*`  
  - `\d{1,}` is the same as `\d+`   
  - `/\d{3}-\d{3}-\d{4}/` matches most U.S. phone numbers  
  - `/A{1,2} bonds/` matches "A bonds" and "AA bonds", not "AAA bonds"  
  - `\w{3,}\s` matches more than three word character with whitespace.  

## Greedy Expressions

- Example 1
  - 01_FY_07_report_99.xls
  - `/\d+\w+\d+/`

- Example 2
  - "Milton","Waddams","Initech, Inc."
  - `/".+", ".+"/`

- Standard repetition quantifiers are greedy.  
- Expression tries to match the longest possible string.  
- Defers to achieving overall match  
  - `/.+\.jpg/` matches "filename.jpg"
  - The `+` is greedy, but "gives back" the ".jpg" to make the match
  - Think of it as rewinding or backtracing
- Gives back as little as possible
  - `/.*[0-9]+/` matches "Page 266"  
  - `/.*/` matches "Page 26" while `/[0-9]+/` matches "6"  

## Lazy Expressions

|Metacharacter|Meaning|
|---|---|
|`?`|Make preceding quantifier lazy|

- Syntax
  - `*?`
  - `+?`
  - `{min,max}?`
  - `??`

- Instructs quantifier to use a "lazy strategy" for making choices  
- Greedy strategy  
  - Match as much as possible before giving control to the next expression part  
- Lazy strategy
  - Match as little as possible before giving control to the next expression part
  - Still defers to overall match
  - Not necessarily faster or slower  

- Examples
  - `/\w*?\d{3}/`
  - `/[A-Za-z-]+?\./`
  - `/.{4,8}?_.{4,8}/`
  - `/apples??/`
- Support
  - Not supported in most Unix tools (BRE,ERE)  

## Efficiency when using repetition

- Efficient matching `+` less backtracking `=` speedy results
- Define the quantity of repeated expressions
  - `/.+/` is faster than `/.*/`
  - `/.{5}/` and `/.{3,7}/` are even faster  
- Narrow the scope of the repeated expression
  - `/.+/` can become `/[A-Za-z]+/`
- Provide clearer starting and ending points
  - `/<.+>/` can become `/<[^>]+>/`
  - Use anchors and word boundaries

- Example
  - `/\w*s/` would be improved as `/\w+s/`
  - `/\w+s/` would be improved as `/[A-Za-z]+s/`
  - Perhaps as `/[a-z]+s/` or as `/[A-Za-z]+s/`  
  - Search for whole words only
    - Spaces, anchors, or word boundaries
    - Scans "picked" but not "icked","cked","ked","ed", or "d"

## Grouping Metacharacters

|Metacharacter|Meaning|
|---|---|
|`{`|Start grouped expression|
|`}`|End grouped expression|

- Group portions of the expression
  - Apply repetition operators to a group
  - Makes expressions easier to read
  - Captures group for use in matching and replacing

- Examples
  - `/(abc)+/` matches "abc" and "abcabcabc"  
  - `/(in)?independent/` matches "independence" and "dependence"  
  - `/run(s)?/` is the same as /runs?/  

## Alternation Metacharacter

|Metacharacter|Meaning|
|---|---|
|`|`|Match previous or next expression|

- `|` is an OR operator
  - Either match expression on the left or match expression on the right
  - Ordered, leftmost expression get precedence
  - Multiple choices can be daisy-chained
  - Group alternation expressions to keep them distinct

- Examples
  - `/apple|orange/` matches "apple" and "orange"  
  - `/apple\|orange/` matches `"apple|orange"`  
  - `/abc|def|ghi|jkl/` matches "abc","def","ghi", and "jkl"  
  - `/apple(juice|sauce)/` is not the same as `/applejuice|sauce/`  
  - `/w(ei|ie)rd/` matches "weird" and "wierd"  

## Writing logical and efficient alternations

- Regular expression engines are eager
- Regular expression engines are greedy
- `/peanut(butter)?/` matches peanutbutter  
- `/(\w+|FY\d{4}_report.xls)/` matches FY2003_report.xls

- Put simplest (most efficient) expression first  
  - `/\w+_\d{2,4}|\d{4}_\d{2}_\w+|export\d{2}/`
  - `/export\d{2}|\d{4}_\d{2}_\w+|\w+_\d{2,4}/`

## Repeating and Nesting alternations

- Repeating
  - First matched alternation does not effect the next matches
  - `/(AA|BB|CC){6}/` matches "AABBAACCAABB"

- Nesting
  - Check nesting carefully  
  - `/(\d{2}([A-Z]{2}|-\d\w\d\w)|\d{4}(-\d{2}-[A-Z]{2,8}|_x[A-F]))/`
  - Trade-off between precision, readability, and efficiency  
  - `/(\d\d|[A-Z][A-Z]){3}/` matches "112233", "AABBCC", "AA66ZZ", "11AA44"  
  - `/[\w]+/` matches all the words

## Start and End Anchors

|Metacharacter|Meaning|
|---|---|
|`^`|Start of string/line|
|`$`|End of string/line|
|`\A`|Start of string,never end of line|
|`\Z`|End of string,never end of line|

- Reference a position, not an actual character  
  - Zero-width
- Examples
  - `/^apple/` or `/\Aapple/`
  - `/apple$/` or `/apple\Z/`
  - `/^apple$/` or `/\Apple\Z/`
- Support
  - `^` and `$` are supported in all regex engines
  - `\A` and `\Z` are supported in Java,.NET,Perl,PHP,Python,Ruby

- Examples
  - `/^\w+@\w+\.[a-z]{3}/` matches "nobody@nowhere.com"
  - `/^[\t ]+/` this will find tab space
  - `/^[\t ]+$/` this will find tab space at the end of the line

## Line breaks and Multiline mode

|Metacharacter|Meaning|
|---|---|
|`^`|Start of string/line|
|`$`|End of string/line|
|`\A`|Start of string,never end of line|
|`\Z`|End of string,never end of line|

- Single-line mode
  - `^` and `$` do not match at line breaks
  - `\A` and `\Z` do not match at line breaks
  - Many Unix tools support only single line
- Multiline mode
  - `^` and `$` will match at the start and end of lines
  - `\A` and `\Z` do not match at line breaks

- __Java:__ `Pattern.compile("^regex$", Pattern.MULTILINE)`  
- __JavaScript:__ `/^regex$/m`  
- __.NET:__ `Regex.Match("string","^regex$", RegexOptions.Multiline)`  
- __Perl:__ `m/^regex$/m`  
- __PHP:__ `preg_match(/^regex$/m,"string")`  
- __Python:__ `re.search("^regex$","string",re.MULTILINE)`  
- __Ruby:__ `string.match(/^regex$/m)`

## Word boundaries  

|Metacharacter|Meaning|
|---|---|
|`\b`|Word boundary (start/end of word)|
|`\B`|Not a word boundary|

- Reference a position, not an actual character  
- Conditions for matching
  - Before the first word character in the string
  - After the last word character in the string
  - Between a word character and a non-word character

- Word characters: `[A-Za-z0-9_]`
- Support
  - Most regex engines, not in early Unix tools `(BREs)`
- Boundary examples
  - `/\b\w+\b/` finds four matches in "This is a test."  
  - `/\b\w+\b/` matches all of "abc_123" but only part of top-notch  
- Not a boundary examples
  - `/\BThis/` does not match "This is a test."  
  - `/\B\w+\B/` finds two matches in "This is a test."`("hi"and"es")`
- `/\b\[w']+\b/` this is select single quotes as well  

- Cautions
  - A space is not word boundary  
  - Word boundaries reference a position  
    - Not an actual character
    - Zero-length

- Examples
  - String: "apples and oranges"
  - No match: `/apples\band\boranges/`
  - Match: `/apples\b \band\b \boranges/`

## Back references

- Grouped expressions are captured
  - Stores the matched portion in parentheses
    - `/a(p{2}l)e/` matches "apple" and stores "ppl"
    - Stores the data matched, not the expression  
  - Automatically, by default

- Backreferences allow access to captured data
  - Refer to first backreference with `\1`

|Metacharacter|Meaning|
|---|---|
|`\1 through \9`|Backreference for positions 1 to 9|

- Usage
  - Can be used in the same expression as the group
  - Can be accessed after the match is complete
  - Cannot be used inside character classes

- Support
  - Most regex engines support `\1` through `\9`
  - Some regex engines support `\10` through `\99`
  - Some regex engines use `$1` through `$9` instead.  

- Examples
  - `/(apples) to \1/` matches "apples to apples"  
  - `/(ab)(cd)(ef)\3\2\1/` matches "abcdefefcdab"  
  - `/<(i|em)>.+?</\1>/` matches `"<i>Hello</i>"` and `"<em>Hello</em>"`  
  - Does not match `"<i>Hello</em>"` or `"<em>Hello</i>"`  

## Back references to optional expressions

- Optional elements
  - `/A?B/` matches "AB" and "B"
- Captures occur on zero-width matches
  - `/(A?)B/` matches "AB" and captures "A"
  - `/(A?)B/` matches "B" and captures ""
- Backreferences become zero-width too
  - `/(A?)B\1/` matches "ABA" and "B"  
  - `/(A?)B\1C/` matches "ABAC" and "BC"  
- Optional elements
  - `/A?B/` matches "AB" and "B"
- Captures do not always occur on optional groups
  - `/(A?)B/` matches "AB" and captures "A"
  - `/(A?)B/` matches "B" and does not capture anything
- Backreferences is to a group that failed to match
  - `/(A?)B\1/` matches "ABA" but not "B"  
  - Except in JavaScript

- Element is optional, group/capture is not optional  
  - `/(A?)B/` matches "B" and captures ""  
- Element is not optional, group/capture is optional  
  - `/(A)?B/` matches "B" and does not captures anything  

## Find and replace using backreferences

- TextMate for Macintosh
  - http://macromates.com
- E for Windows
  - http://e-texteditor.com

- Create a regular expression that matches target data
- Test regular expression and revise as needed
  - Use anchors and specificity to narrow scope
- Add capturing groups
  - Capture anything that varies row-to-row
- Write the replacement string
  - Use all captures
  - Add back anything not captured but still needed
  - May need to use `$1` instead of `\1`

## Non-capturing group expressions

|Metacharacter|Meaning|
|---|---|
|`?:`|Specify a non-capturing group|

- Syntax  
  - `/(\w+)/` becomes `/(?:\w+)/`  

- Turns off capture and backreferences  
  - Optimize for speed  
  - Preserve space for more captures  

- Support
  - Most regex engines except Unix tools  

- Examples
  - `/(oranges) and (apples) to \1/` matches "oranges and apples to oranges"  
  - `/(oranges) and (apples) to \2/` matches "oranges and apples to apples"  

- `/(?:regex)/`
  - `?` = "Give this group a different meaning"
  - `:` = "The meaning is non-capturing"

## Positive lookahead assertions

|Metacharacter|Meaning|
|---|---|
|`?=`|Positive lookahead assertion|

- Assertion of what ought to be a head
  - If lookahead expression fails, the match fails
  - Any valid regular expression can be used
  - Zero-width, does not include group in the match
- Support
  - Most regex engines except Unix

- Syntax
  - `/(?=regex)/`

- Examples
  - `/(?=seashore)sea/` matches "sea" in "seashore" but not "seaside"
  - Same as `/sea(?=shore)`

## Double testing with lookahead

- Examples
  - `/(?=seashore)sea/` matches "sea" in "seashore" but not "seaside"
  - Same as `/sea(?=shore)`

- Match a pattern that also matches another pattern
  - `/\d{3}-\d{3}-\d{4}/` matches "555-302-4321" and "555-781-6978"
  - `/^[0-5\-]+$/` matches "555-302-4321" and "23140-5"
  - `/(?=^[0-5\-]+$)\d{3}-\d{3}-\d{4}/` matches "555-302-4321"
  - `/(?=^[0-5\-]+$)(?=.*4321)\d{3}-\d{3}-\d{4}/` matches "555-302-4321"

## Negative lookahead assertions

- Syntax
  - `/(?!regex)/`

- Examples
  - `/(?!seashore)sea/` matches "sea" in "seaside" but not "seashore"  
  - Same as `/sea(?!shore)/`
  - `/online(?! training)/` does not match "online training"
  - `/online(?!.*training)/` does not match "online video training"
  - `/(\bblack\b)(?!.*\1)/` match black in sentence.  

## Lookbehind assertions

- Assertion of what ought to be behind
  - Similar to lookahead assertions
  - If lookbehind expression fails, the match fails
  - Any valid regular expression can be used
  - Zero-width, does not include group in the match

- Syntax
  - `/(?<=regex)/`
  - `/(?<!regex)/`
- Examples
  - `/(?<=base)ball/` matches the "ball" in "baseball" but not "football"
  - Same as `/ball(?<=baseball)/`
  - `/(?<=base)ball/` matches the "ball" in "footfball" but not "baseball"

- Support
  - Simple expressions in .NET,Java,Perl,PHP,Python,Ruby 1.9
  - Not supported in JavaScript,Ruby 1.8, Unix
- Simple expressions means fixed length
  - Literal text
  - Character classes
  - No repetition or optional expressions
  - Alternation only with fixed-length items
    - Allowed: `(?<=cat|dog|rat)`
    - Not allowed: `(?<=apple|banana|plum)`

## The power of positions

- Allows testing of a regular expression apart from matching  
  - Peek forwards or backwards
    - `/sea(?=shore)/`
  - Match a string using multiple expressions
    - `/^(?=.*\d)(?=.*[A-Z]).{8,15}$/`
  - Define rejection expressions
    - `/online(?! training)/`
  - Find last occurrence
    - `/(item)(?!.*\1)/`
- Zero-width means zero position movement
  - `/(?=seashore)sea/` matches "sea" in "seashore"
  - `/(?<![$\d])\d+\.\d\d/` matches "54.00" but not "$54.00"
  - `/(?<![$\d])(?=\d+\.\d\d)/`
    - What gets matched?
    - Where is the regular expression engine pointer?
  - Useful for inserting text (using find and replace)  

## ABOUT UNICODE

- Single byte
  - Uses one byte (eight bits) to represent a character
  - Allows for 256 characters
  - A-Z, a-z, 0-9, punctuation, common symbols

- Double byte
  - Uses two bytes (16 bits) to represent a character
  - Allows for 65,536 characters

- Many more characters than English alphabet
  - Latin:
  - Symbols:
  - Arabic, chinese, Greek, Hebrew, Korean, Thai, ...
  - Over 109,000 characters

- Unicode
  - variable byte size
  - Maintains compatibility with one- and two-bye encoding
  - Allows for over one million characters
  - Mapping between a character and a number
  - "U+" followed by a four-digit hexadecimal number
    - 'infinite' is written as `U+221E`
  - Combinations
    - Can combine more than two

## Unicode in regular expressions

- Complications for regular expressions
  - Words can be spelled multiple ways
    - "cafe", "cafe"
  - Words can be encoded multiple ways
    - "cafe" can be encoded as four or five characters
  - Wildcard matching
  - Backtracking
  - Unicode is relatively new
- Unicode indicator: `\u`  
  - `\u` followed by a four-digit hexadecimal number `(0000-FFFF)`  
  - `/caf\u00E9/` matches "cafe" but not "cafe"  
- Support
  - Java,JavaScript,.NET,Python,Ruby
  - Perl and PHP use `\x` instead
  - Not supported in older Unix tools

## Unicode wildcard and properties  

- Unicode wildcard: `\x`
  - Matches any single character
  - Always matches line breaks `(like /./s)`
  - `/caf\X/` matches "cafe" and "cafe"

- Support
  - Only supported in Perl and PHP

- Unicode property: \p{property}
  - Matches characters that have a property
  - `/\p{Mark}/` or `/\p{M}/` matches any "mark" (accents)  
  - `/\p{Letter}/` or `/\p{L}/` matches any letter

|Unicode property|Abbreviation|
|---|---|
|Letter|L|
|Mark|M|
|Separator|Z|
|Symbol|S|
|Number|N|
|Punctuation|P|
|Other|C|

- Unicode not-property:\P{property}
  - Matches characters that do not have a property
  - `/caf\P{M}\p{M}/` matches "cafe"

- Support
  - Java,.NET,Perl,PHP,Ruby
  - Not JavaScript,Python, and Unix tools

## How to use this chapter

- Not one-size-fits-all regular expressions
- Any regular expression can be written broadly or narrowly
  - Broad: permissive
  - Narrow: restrictive, brittle
- Regular expression to match a year
  - `/\d{4}/` matches 2005, but also `0000-9999`
  - `/(19|20)\d\d/` matches `1900-2099`
  - `/(19[5-9]\d|20[0-4]\d)/` matches `1950-2049`
- How to write or customize a regular expression
  - Examine the data to be matched
  - Determine what aspects of the data are important
  - Determine what level of precision is required.
  - Make a list of "edge cases" to test
    - Longest, shortest
    - Highest, lowest
    - Most unusual, most oddly-formatted
  - Use anchors, delimiters, or context
    - `/\w+/` matches `"%^@X&*!"`
    - `/^\w+$/`
    - `/\b\w+\b/`
    - `/ \w+ /`
    - `/,\w+,/`
    - `/and \w+\./`
  - Be mindful of greediness and laziness

## Matching postal codes

- U.S. postal code format
  - Five digits
  - Five digits, dash, four digits
  - `/^\d{5}(?:|-\d{4})?$/` matches 10010-6543
- Canada postal code format
  - A9A 9A9
  - `/^[A-Z]\d[A-Z] \d[A-Z]\d$/`
- U.K. postal code formats
  - A9 9AA
  - A99 9AA
  - AA9 9AA
  - AA99 9AA
  - A9A 9AA
  - AA9A 9AA

## Matching email address

- `/^[\w.%+\-]+@[\w.\-]+\.[A-Za-z]{2,6}$/` matches someone@somewhere.com,someone@somewhere.co.uk

## Matching URLS

Example
- http://www.nowhere.com
- http://nowhere.com
- http://blog.nowhere.com
- https://www.nowhere.com
- http://www.nowhere.com/product_page.html
- http://www.nowhere.com/images/image.gif
- http://www.nowhere.com/product/
- http://www.nowhere.com/product/3456
- http://www.nowhere.com/product_page.php?product=28
- http://www.nowhere.com?product=28&color=blue
- http://www.nowhere.com#details

- `/^(?:http|https):\/\/[\w\-_]+(?:\.[\w\-_]+)+[\w\-.,@?^=%&:/~\\+#]*$/`

## Matching decimal numbers and currency

Decimal or floating point samples  
- 5.1
- 314.27918
- 0.123
- .345
- 23

- `/^(\$|\u00A3|\u00A5|\uFFE5)(\d*\.\d{2}|\d+)$/m`

## Matching IP Addresses

- IP address samples
  - 255.255.255.255
  - 0.0.0.0
  - 67.52.159.38
  - 067.052.159.038
- `/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/m`

## Matching dates

Date samples
- 2000-11-15
- 2000-6-9
- 2000-06-09
- 2000/6/9
- `/^(19[5-9][0-9]|20[0-4][0-9]|2050)[-/](0?[1-9]|1[012])[-/](0?[1-9]|[12][0-9]|3[01])$/m`

## Matching time

Time samples  
- 2:34
- 2:34pm
- 2:34PM
- 02:34
- 14:34
- 14:34:56
- 14:34 EST
- 14:34 GMT -5
- `/^([0-1]?[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?( ([A-Z]{3}|GMT [-+]([0-9]|1[0-2])))?$/m`

## Matching HTML tags

HTML samples

```
<strong>Bold</strong>
<em>Emphazied</em>
<b>Bold</b>
<i>Italics</i>
<span id="foo" class="bar">Some text</span>
<hr />
```
- `/^<(?:([A-Za-z][A-Za-z0-9]*)\b[^>]*>(?:.*?)</\1>|[A-Za-z][A-Za-z0-9]*\b[^/>]*/>)$/m`

## Matching passwords

- Password requirements
  - May contain any character except space
  - At least 8 characters long
  - No more than 15 characters long
  - Must include at least one uppercase letter
  - Must include at least one lowercase letter
  - Must include at least one numeric digit
  - Must include at least one symbol

- `/^(?=.*\d)(?=.*[~!@#$%^&*()_\-+=|\\{}[\]:;<>?/])(?=.*[A-Z])(?=.*[a-z])\S{8,15}$/m` matches `sword#42Fish`

## Matching credit card numbers

- American Express
  - 370012345612345,3700-123456-12345

- Visa
  - 4000123412341234,4000-1234-1234-1234

- Mastercard
  - 5100123412341234,5100-1234-1234-1234

- Discover
  - 6011123412341234, 6011-1234-1234-1234

- `/^(?:3[47]\d{2}([\- ]?)\d{6}\1\d{5}|(?:4\d{3}|5[1-5]\d{2}|6011)([\- ]?)\d{4}\2\d{4}\2\d{4})$/m`


## To match program error logs

- `(\w+)\(([\w\.]+):(\d+)\)`

## To match the tags html or xml tags

- To match first open tag
  - `<(\w+).`

- To match the data between the tag
  - `>([\w\s]*)<`

- To match the attribute of the tag like color class
  - `='([\w://.]*)'`

## Reference:

https://www.geeksforgeeks.org/regular-expression-grep/  
https://www.digitalocean.com/community/tutorials/using-grep-regular-expressions-to-search-for-text-patterns-in-linux  
http://www.robelle.com/smugbook/regexpr.html  
https://www.cs.cmu.edu/~ab/15-123S09/lectures/Lecture%2018%20-%20Regular%20Expressions.pdf  
https://www.journaldev.com/41403/regex-with-grep  
https://www.shellhacks.com/regex-find-ip-addresses-file-grep/  
https://www.putorius.net/grep-an-ip-address-from-a-file.html  
https://unix.stackexchange.com/questions/296596/how-to-check-if-any-ip-address-is-present-in-a-file-using-shell-scripting  
