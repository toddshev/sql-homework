"""
'''
SQL methods to return code hints:
create
select
update
delete
insert
join
agg
sub
conn
'''

"""
import pandas as pd

class Helper:
    def __init__(self):
        pass
        
    def create(self):
        print("CREATE TABLE <tablename> ( \n"
               "    <field1> SERIAL PRIMARY KEY,\n"
               "    <field2> INT,\n"
               "    <field3> DOUBLE PRECISION,\n"
               "    <field4> FLOAT(10)\n"
               ");"
        )
    
    def select(self):
        print("SELECT <field1>, <field2>, <field3> (or *)\n"
              "FROM <table>\n"
              "WHERE condition (i.e. <field1> > 100)\n"
              "ORDER BY <field1> ASC;"
        )
    
    def update(self):
        print("UPDATE <table>\n"
              "SET <field> = newvalue\n"
              "WHERE <field> = oldvalue;"
        )
    
    def delete(self):
        print("DELETE FROM table\n"
              "WHERE <field1> = value;"
        )
    
    def insert(self):
        print("INSERT INTO table\n"
               "  (<field1>,<field2>,<field3>,<field4>)\n"
               "VALUES\n"
               "(<field1Val>,<field2Val>,<field3Val>,<field4Val>);"
        )
     
    def join(self):
        print("SELECT tbl1.<field1>, tbl1.<field2>, tbl2.<field1>, tbl2.<field2>\n"
              "FROM tbl1 AS alias\n"
              "INNER/LEFT/RIGHT/FULL OUTER/CROSS JOIN tbl2 as alias2 ON alias.<field1> = alias2.<field2>;"
             
        )
        
    def agg(self):
        print("SELECT COUNT(<field>) FROM table;\n\n"
              "SELECT <field1>, COUNT(<field2>) AS \"Total Field2s\"\n"
              "GROUP BY <field1>;"
        )
        
    def sub(self):
        print("SELECT * \n"
              "FROM table \n"
              "WHERE <field2> IN\n"
              "(\n"
              "  SELECT <field1>\n"
              "  FROM table2\n"
              "  WHERE <field2> = value\n"
              ");"
             
        )
        
    def conn(self):
        print("engine = create_engine(\"postgresql://postgres:postgres@localhost:5432/estate_db\")")
    def fireup(self,db_name):
        from sqlalchemy import create_engine
        engine = create_engine(f"postgresql://postgres:postgres@localhost:5432/{db_name}")
        query = f"SELECT * FROM {db_name}"
        df = pd.read_sql(query, engine)
        return df