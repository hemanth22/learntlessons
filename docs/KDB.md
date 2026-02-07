## KDB Query command to list all tables

```qSQL
tables[]
```

## KDB Query to check the count of data
```qSQL
select count i from table_name where date=2026.01.22, sym like "*search_keyword*", time.time within(04:00:00,06:00:00), msg like "*search_keyword*"
```

## KDB Query select query
```qSQL
select sym, date, time, msg from table_name where date=2026.01.22, sym like "*search_keyword*", time.time within(04:00:00,06:00:00), msg like "*search_keyword*"
```
