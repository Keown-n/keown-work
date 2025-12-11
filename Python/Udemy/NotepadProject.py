import sys


class Notepad:
    def __init__(self, author: str, file_name: str) -> None:
        self.author = author
        self.file_name = file_name

    def _show_instructions(self) -> None:
        print(f'Welcome to Notepad, {self.author}')
        print('Commands:')
        print('1 - write note')
        print('2 - display note')
        print('0 - exit Notepad')

    def run(self) -> None:
        """Main application loop"""
        while True:
            self._show_instructions()
            choice = input('Your choice: ').strip()

            if choice == '0':
                print('Goodbye!')
                sys.exit(0)
            elif choice == '1':
                self._write_note()
            elif choice == '2':
                self._display_note()
            else:
                print('Invalid choice, try again')

    def _write_note(self) -> None:
        """Write a new note to the file"""
        note = input('Enter your note: ')
        with open(self.file_name, 'a') as f:
            f.write(note + '\n')
        print('Note saved!')

    def _display_note(self) -> None:
        """Display all notes from the file"""
        try:
            with open(self.file_name, 'r') as f:
                print('\n--- Your Notes ---')
                print(f.read())
                print('-----------------\n')
        except FileNotFoundError:
            print('No notes found. Write your first note!')


if __name__ == '__main__':
    notepad = Notepad(author='User', file_name='notes.txt')
    notepad.run()