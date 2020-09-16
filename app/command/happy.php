<?php
declare (strict_types = 1);

namespace app\command;

use think\console\Command;
use think\console\Input;
use think\console\input\Argument;
use think\console\input\Option;
use think\console\Output;

class happy extends Command
{
    protected function configure()
    {
        // 指令配置
        $this->setName('happy')
            ->setDescription('自定义命令');
    }

    protected function execute(Input $input, Output $output)
    {
    	// 指令输出
        event('happyListen');
    	$output->writeln('happy');
    }
}
