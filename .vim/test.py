import sys
import csv

def headers():
    return 'Date,Payee,Category,Memo,Outflow,Inflow'

class Transaction():
    def __init__(self):
        self.date = ''
        self.payee = ''
        self.category = ''
        self.memo = ''
        self.outflow = ''
        self.inflow = ''

    def __str__(self):
        return ','.join([self.date, self.payee, self.category, self.memo, self.outflow, self.inflow])

class Transaction_Parser():
    def __init__(self, csvf):
        self.csvf = csvf
        
    def parse(self, mode):
        # Return each row as transaction object 
        if 'citi' in mode.lower():
            return self.citi_parse()
        
        raise Exception("Transaction parser not recognized")

    def citi_parse(self):
        reader = csv.reader(self.csvf, delimiter=',', quotechar='"')
        
        # Skip header
        reader.next()

        transactions = []
        for row in reader:
            t = Transaction()
            t.date = row[1]
            t.payee = row[2].split('  ')[0]
            t.outflow = row[3]

            # Skip credit payment rows
            if 'ONLINE PAYMENT' in t.payee:
                continue

            transactions.append(t)

        return transactions 

    def convert(self, mode):
        transactions = self.parse(mode)
        return '\n'.join([str(t) for t in transactions])

print headers()
with sys.stdin as csvf:
    parser = Transaction_Parser(csvf)
    print parser.convert(sys.argv[1])
