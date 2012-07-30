
 
 <div class="row">
      <div class="span3"><a href="{$td_url}/index.php?page=tickets&amp;act=add"><i class="icon-file"></i> {$lang['open_ticket']}</a></div>
      <div class="span3"> 
  {if $cache['settings']['kb']['enable'] && $user['g_kb_access']}
      <a href="{$td_url}/index.php?page=kb"><i class="icon-search"></i> {$lang['knowledge_base']}</a>
  {else} 
      <a href="{$td_url}/index.php?page=tickets&amp;act=history"><i class="icon-search"></i> {$lang['ticket_history']}</a>
      <a href="{$td_url}/index.php?page=tickets&amp;act=history">{$lang['ticket_history']}</a>
 {/if} 
  </div>
</div>
   <hr>


<div class="row">
<div class="span7">
    {if $news}

          <h3>{if $cache['settings']['news']['page']}<a href="{$td_url}/index.php?page=news">{/if}{$lang['news']}{if $cache['settings']['news']['page']}</a>{/if}</h3>
            {foreach $news as $n}
            {if $cache['settings']['news']['page']}<a href="{$td_url}/index.php?page=news&amp;act=view&amp;id={$n['id']}">{/if}{$n['title']}{if $cache['settings']['news']['page']}</a>{/if}<span class="date"> -- {$n['date_human']}</span>

                {if $n['excerpt']}
                {$n['excerpt']}
                {else}
                {if $cache['settings']['news']['page']}<a href="{$td_url}/index.php?page=news&amp;act=view&amp;id={$n['id']}">{$lang['read_on']}</a>{else}<i>{$lang['no_excerpt']}</i>{/if}
                {/if}

            {/foreach}
            <br />

    {/if}
    
    <hr>
</div>
</div>
    
    

            <h3>{$lang['tickets_overview']}</h3>
            <br />
            <table class="table table-striped">
            <tr>
                <th width="5%" align="left">{$lang['id']}</th>
                <th width="27%" align="left">{$lang['subject']}</th>
                <th width="14%" align="left">{$lang['priority']}</th>
                <th width="20%" align="left">{$lang['department']}</th>
                <th width="20%" align="left">{$lang['last_reply']}</th>
                <th width="14%" align="left">{$lang['status']}</th>
            </tr>
            {if $user['id'] or $user['s_tkey']}
            {if $tickets}
            {foreach $tickets as $t}
            {$ticket_rows = $ticket_rows+1}
            {if $ticket_rows & 1}{$ticket_class = 1}{else}{$ticket_class = 2}{/if}
            <tr>
                <td class="option{$ticket_class}-mini"><a href="{$td_url}/index.php?page=tickets&amp;act=view&amp;id={$t['mask']}">{$t['mask']}</a></td>
                <td class="option{$ticket_class}-mini"><a href="{$td_url}/index.php?page=tickets&amp;act=view&amp;id={$t['mask']}">{if $t['escalated']}<img src='{$img_url}/icon_escalate.png' alt='E' style='vertical-align:middle;margin-bottom:2px' />&nbsp;{/if}{$t['subject']}</a></td>
                <td class="option{$ticket_class}-mini"><img src="{$td_url}/images/priorities/{$t['icon_regular']}" alt="{$t['pname']}" class="prioritybox" />&nbsp;&nbsp;{$t['pname']}</td>
                <td class="row{$ticket_class}-mini">{$t['dname']}</td>
                <td class="row{$ticket_class}-mini">{$t['last_reply_human']}</td>
                <td class="option{$ticket_class}-mini">{$t['status_abbr']}</td>
            </tr>
            {/foreach}
            {else}
            <tr>
                <td class="option1" colspan="6" align="center">{$lang['no_tickets']}</td>
            </tr>
            {/if}
            {else}
            <tr>
                <td class="option1" colspan="6" align="center">{$lang['no_tickets_login']}</td>
            </tr>
            {/if}
            </table>
            <br />
        </td>
    </tr>
    </table>
