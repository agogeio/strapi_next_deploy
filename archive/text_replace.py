# Open the file in read mode and read its contents

domain = input("What is the domain name to be used?: ")
src_file = './domain.template'

with open(src_file, 'r', encoding='utf-8') as file:
    content = file.read()

# Replace the specific text
modified_content = content.replace('domain.template', domain)

# Open the file in write mode and write the modified contents
with open(f'./{domain}', 'w', encoding='utf-8') as file:
    file.write(modified_content)