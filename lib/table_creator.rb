class TableCreator
  PATH = 'https://github.com/AndriiKot/___Icons__and__Links___/blob/main/icons/'
  K = 2 # число пробелов для метода with_indent
  FILE_TO_WRITE = './README.md'

  def initialize
    @stacks = YAML.safe_load_file('config/tecnology_stacks.yml')
    @logos = YAML.safe_load_file('config/logos.yml')
    File.open(FILE_TO_WRITE, 'w') {|file| file.truncate(0) }
  end

  def add_tables
    @stacks.each do |stack_name, technologyes|
      create_table(100, technologyes)
    end
  end

  private
  def create_table(height, options)
    File.open(FILE_TO_WRITE, 'a+') do |f|
      f.puts with_indent("<table>")

      f.puts with_indent("<thead>", 1)
      f.puts with_indent("<tr>", 2)

      options.each do |technology_name|
        f.puts with_indent("<th height=#{height / 3}>#{technology_name}</th>", 3)
      end

      f.puts with_indent("</tr>", 2)
      f.puts with_indent("</thead>", 1)

      f.puts with_indent("<tbody>", 1)
      f.puts with_indent("<tr>", 2)

      options.each do |technology_name|
        f.puts with_indent("<td height=#{height} width=#{height}>", 3)
        f.puts with_indent("<img src=#{PATH}#{@logos[technology_name]} alt=#{technology_name}>", 4)
        f.puts with_indent("</td>", 3)
      end

      f.puts with_indent("</tr>", 2)
      f.puts with_indent("</tbody>", 1)

      f.puts with_indent("</table>")
    end
  end

  def with_indent(tag_part, n=0)
    ' ' * (n * K) + tag_part
  end
end
