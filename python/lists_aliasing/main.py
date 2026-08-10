original = [1, 2, 3]
alias = original          # alias and original are the SAME list
alias.append(4)
print(original)           # also changed! both names point to one list

independent = original.copy()
independent.append(5)
print(original)           # unaffected
print(independent)
