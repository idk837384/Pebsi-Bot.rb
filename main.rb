require 'discordrb'
require 'yaml'
load 'keepalive.rb'
token = ENV["tocke"] #replace ENV["tocke"] with whatever your bot token is, inside of ""
bot = Discordrb::Bot.new token: token

@logs=[]

#different units of time in seconds
@minute=60
@hour=3600
@day=86400
@week=604800


bot.ready() { |msg|
    bot.playing=('Pe:help')
    puts "Logged in as " + bot.name 
}
=begin
expirimental logging tools(will puts to console the deleted message, NO other info is logged)
bot.message() { |msg|
    @logs[@logs.length]=msg.text
    @logs[@logs.length]=msg.message.id
    @logs[@logs.length]=msg.user
    puts @logs
}
bot.message_delete(){ |msg|
    i=0
    while i<@logs.length
        if @logs[i]==msg.id
            puts 'Message deleted: ' + @logs[i-1]
        end
        i+=1
    end
}
=end
bot.message(from: not!([''])) { |msg|
    puts msg.text
    if msg.text.downcase == 'pe:await'
       # msg.respond 'Please send a message'
        #bot.add_await('!', Discordrb::Events::MessageEvent, { from: msg.author, in: msg.message.channel }){|msg|
          #  msg.respond 'it works! You said: ' + msg.text
            #return true
        #}
    end
    
    if msg.text.downcase.split(' ')[0] == 'pe:tagcreate'
        test=YAML.load(File.open("test.yml"))
        puts test
        msg.respond 'New tag created with the name ' + msg.text.downcase.split(' ')[1] + ' and the value ' + msg.text.downcase.split(' ')[2] + '!'
        data = test
        data[msg.text.downcase.split(' ')[1]]=msg.text.downcase.split(' ')[2]
        File.open("test.yml", "w") {|f| f.write(data.to_yaml)}
    end
    if msg.text.downcase.split(' ')[0] == 'pe:tagall'
        test=YAML.load(File.open("test.yml"))
        mes='*All Tags:*
'
        test.compact!
        test.each do |a,b|
            mes<<a
            mes<<'
'
        end
        msg.respond mes
    end
    if msg.text.downcase.split(' ')[0] == 'pe:tagsearch'
        test=YAML.load(File.open("test.yml"))
        @tFou=''
        test.each { |x, y| 
        if x.to_s == msg.text.downcase.split(' ')[1]
            @tFou=true
            @res=y
        else
            
        end
        }
        if @tFou==true
            msg.respond @res.to_s
        else
            msg.respond 'Unable to find tag by the name ' + msg.text.downcase.split(' ')[1] +'! Maybe try creating it?'
        end
        
    end

    
    if msg.text.downcase.split(' ')[0] == 'pe:dmjack'
        msg.text.gsub!(/pe:dmjack/, '')
        msg.text.gsub!(/pe:DMjack/, '')
        msg.text.gsub!(/pe:DMJack/, '')
        bot.user(550495837348691999).dm(msg.text)
    end
    if msg.text.downcase.split(' ')[0] == 'pe:dm'
        reci=msg.text.split(' ')[1].to_i
        msg.text.gsub!(/pe:dm/, "")
        msg.text.gsub!(/Pe:dm/, "")
        msg.text.gsub!(/\d+/,"")
        msg.text.gsub!(/<@>/, '')
        if msg.message.mentions.length >= 1
            msg.message.mentions[0].dm(msg.text)
        else
            bot.user(reci).dm(msg.text)
        end
    end

    if msg.text.downcase.split(' ')[0] == 'pe:purge'
        if msg.message.user.permission?(:manage_messages)
                msg.message.channel.prune(msg.text.split(' ')[1].to_i+1)
        else
            msg.respond 'Are you sure you\'re supposed to be using that command? 🤨'
        end
    end

    if msg.text.downcase == 'pe:help'
        msg.respond ">>> **Pebsi Command List**(*Messages with a <:slashcommand:1011483071675109458> after them have support for slash commands!*):
        *<@1003128494156435536> opinion on [insert text here]*: Pebsi will state its opinion on your given text.<:slashcommand:1011483071675109458>
        *pe:roll [insert number].[insert number]*: Pebsi will give you a random number between the 2 provided integers.<:slashcommand:1011483071675109458>
        *pe:say [insert text here]:* Pebsi will delete your command and will send your given text.
        *pe:dm [insert user id OR ping user] [insert text(NO NUMBERS!)]:* Pebsi will DM the given user-id the chosen text to send.<:slashcommand:1011483071675109458>
        *pe:dmjack [insert text here]*: Pebsi will DM 'Jack At it Again' the chosen text.
        *pe:purge [insert number]*: Pebsi will delete as many messages as you told it to (Command requires the manage_messages permission) <:slashcommand:1011483071675109458>
**Pebsi Feature List:**
        *Auto-pin:* Pebsi will automatically pin any message that recieves 3 or more ⭐ reactions.
        
***Say pe:experimental for the commands still in beta!*** ||| **Bot Developed by**: Idk837384"
    end
    if msg.text.downcase == 'pe:experimental'
        msg.respond ">>> **Experimental Pebsi Commands:**
        *pe:tagCreate [tag name] [value]*: Create a new tag with the given input.
        *pe:tagSearch [tag name]*: Searches for the tag with the name given, name given must be exact.
        *pe:tagAll*: Will send a message displaying all the current tags.

**These commands may be buggy and unstable as they are still in beta! The command names may change or be removed in the future!**"
    end
    
    if msg.message.channel.pm? == true
        bot.user(805558459562721340).dm('From:' + msg.message.user.username + ' ' + msg.content)
    end
}
bot.message(from: ['Idk837384', 'Ettecentric']) { |msg|
    if msg.text.downcase.split(' ')[0] == 'pe:say'
        msg.text.gsub!(/pe:say/, "")
        msg.text.gsub!(/Pe:say/, "")
        sleep(0.6)
        msg.respond msg.text
        msg.message.delete
    end
    
    if ((msg.text.downcase.split(' ')[0] == 'pe:tagdelete') || (msg.text.downcase.split(' ')[0] == 'pe:tagdel'))
        data=YAML.load(File.open("test.yml"))
        data[msg.text.downcase.split(' ')[1]]=nil
        data.compact!
        File.open("test.yml", "w") {|f| f.write(data.to_yaml)}
        msg.respond 'Tag "' + msg.text.split(' ')[1] + '" was deleted from the tag database!'
    end

    if msg.text.downcase.split(' ')[0] == 'pe:blacklist'
        usli=YAML.load(File.open("tiMe.yml"))
        user=msg.message.mentions[0]
        user.on(msg.message.server).add_role('1003135748251324546')
        if msg.text.downcase.split(' ')[3] == 'minute'
            @time=@minute*msg.text.downcase.split(' ')[2].to_i
        elsif msg.text.downcase.split(' ')[3] == 'hour'
            @time=@hour*msg.text.downcase.split(' ')[2].to_i
        elsif msg.text.downcase.split(' ')[3] == 'day'
            @time=@day*msg.text.downcase.split(' ')[2].to_i
        end
        @curTi=Time.now
        @curTi+=@time
        usli[user.id]=@curTi.to_i
        File.open("tiMe.yml", "w") {|f| f.write(usli.to_yaml(:inline => false))}
    end
}
bot.message(in: "#pebsi") { |msg|
    if msg.text.downcase.split(' ')[0] == 'pe:say'
        msg.text.gsub!(/pe:say/, "")
        msg.text.gsub!(/Pe:say/, "")
        sleep(0.6)
        msg.respond msg.text
        msg.message.delete
    end

    
    if msg.text.downcase.split(" ")[0] == 'pe:roll'  
        content1=msg.text.split(" ")[1]
        content2=msg.text.split(".")[1]
        number1=rand(content1.to_i..content2.to_i)
          msg.respond('You rolled: ' + number1.to_s + '!')
    end
    
     if msg.text.downcase.split(' ')[0] == 'pe:play'
        channel = msg.message.author.voice_channel
        bot.voice_connect(channel)
     end
}

bot.mention() { |msg|
    
  if msg.text.downcase.include? 'opinion on'

    reaction = ['mid', 'just plain shitty', 'terrible', 'great', 'the greatest thing ever!!', '... actually I\'m sick of this crap, figure it out yourself!', 'magnificant!']
    rando = rand(0..6)

  #puts msg.text.split(' ')[msg.text.split(' ').length-1]    
  #Linguistics.use :eng
  msg.text.gsub!(/[?]/, "")
  msg.text.gsub!(/<@1003128494156435536> opinion on/, '')
  msg.text.gsub!(/<@1003128494156435536> Opinion on/, '')
 # pluralMSG = msg.text.split(/\W/).last.en.plural(2)
  #puts pluralMSG
  #puts msg.text.split(' ')[msg.text.split(' ').length-1]

#pluralMSG == msg.text.split(' ')[msg.text.split(' ').length-1]
  if msg.text.downcase[msg.text.downcase.length-1] == 's'
  #if pluralMSG.length < msg.text.split(' ')[msg.text.split(' ').length-1].length
    aBsis="are"
  else
    aBsis='is'
  end
        if msg.message.mentions.length < 2
            msg.respond msg.text + ' ' + aBsis + ' ' + reaction[rando]
        else
            msg.respond msg.text + ' is ' + reaction[rando]
        end
  end
}

bot.reaction_add() do |msg|
  if msg.message.reacted_with('⭐').length > 2
    msg.message.pin
  end
end

#everything below is for reaction-roles code
bot.reaction_add() do |event|
  if event.message.hash == 1006415557131763722
      if event.emoji.name == '🟥'
          event.user.add_role('968276588330356737')
      elsif event.emoji.name == '🟪'
          event.user.add_role('968276512933552179')
      elsif event.emoji.name == '🟦'
          event.user.add_role('968276125526675537')
      elsif event.emoji.name == '👝' #teal
          event.user.add_role('968276869524893696')
      elsif event.emoji.name == '🟩'
          event.user.add_role('968276672682020904')
      elsif event.emoji.name == '🐷'#pink/fuschia
          event.user.add_role('968277085510586428')
      elsif event.emoji.name == '🟧'
          event.user.add_role('968276258607751208')
      end
  end
end

bot.reaction_remove() do |event|
  if event.message.hash == 1006415557131763722
      if event.emoji.name == '🟥'
          event.user.remove_role('968276588330356737')
      elsif event.emoji.name == '🟪'
          event.user.remove_role('968276512933552179')
      elsif event.emoji.name == '🟦'
          event.user.remove_role('968276125526675537')
      elsif event.emoji.name == '👝' #teal
          event.user.remove_role('968276869524893696')
      elsif event.emoji.name == '🟩'
          event.user.remove_role('968276672682020904')
      elsif event.emoji.name == '🐷' #pink/fuschia
          event.user.remove_role('968277085510586428')
      elsif event.emoji.name == '🟧'
          event.user.remove_role('968276258607751208')
      end
  end
end


bot.reaction_add() { |event|
    puts event.emoji.mention
  if event.message.hash == 1006652711657287711
        if event.emoji.name == '🎮'
            event.user.add_role('1003135748251324546')
        elsif event.emoji.name == '🖌️'
            event.user.add_role('1004935589772148756')
        elsif event.emoji.name == '🎧'
            event.user.add_role("1004935959231606946")
        end
  end
}
bot.reaction_remove() { |event|
  if event.message.hash == 1006652711657287711
        if event.emoji.name == '🎮'
            event.user.remove_role('1003135748251324546')
        elsif event.emoji.mention == '🖌️'
            event.user.remove_role('1004935589772148756')
        elsif event.emoji.name == '🎧'
            event.user.remove_role("1004935959231606946")
        end
  end
}

#reaction-roles end

keepalive()
bot.run